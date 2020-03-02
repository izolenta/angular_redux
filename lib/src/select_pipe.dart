import 'dart:async';

import 'package:angular/angular.dart';
import 'package:redux/redux.dart';

@Pipe('select', pure: false)
class SelectPipe<T> implements PipeTransform, OnDestroy {
  final Store<T> _store;
  final ChangeDetectorRef _detector;

  dynamic _value;
  dynamic Function(T state) _selector;
  StreamSubscription<T> _subscription;

  SelectPipe(this._store, this._detector);

  dynamic transform(dynamic Function(T state) selector) {
    if (_selector == null) {
      _value = selector(_store.state);
      _selector = selector;
      _subscription = _store.onChange.listen(_onStateChange);
    }

    return _value;
  }

  @override
  void ngOnDestroy() {
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  void _onStateChange(T state) {
    final dynamic value = _selector(state);

    if (!identical(value, _value)) {
      _value = value;
      _detector.markForCheck();
    }
  }
}
