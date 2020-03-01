import 'dart:async';

import 'package:angular/angular.dart';
import 'package:redux/redux.dart';

class SelectPipe<T> implements PipeTransform, OnDestroy {
  final Store<T> _store;
  final ChangeDetectorRef _detector;

  dynamic _value;
  dynamic Function(T state) _selector;
  StreamSubscription<T> _subscription;

  SelectPipe(this._store, this._detector);

  dynamic transform(dynamic Function(T state) selector) {
    _selector = selector;

    if (_subscription == null) {
      _value = selector(_store.state);
      _subscription = _store.onChange.listen(_onStateChange);
    }

    return _value;
  }

  @override
  void ngOnDestroy() {
    if (_subscription == null) {
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
