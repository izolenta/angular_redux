import 'dart:async';

import 'package:angular/angular.dart';
import 'package:redux/redux.dart';

@Pipe('select', pure: false)
class SelectPipe<T> implements PipeTransform, OnDestroy {
  final Store<T> _store;
  final ChangeDetectorRef _detector;

  dynamic _value;
  dynamic Function(T state) _selector;
  bool Function(dynamic a, dynamic b) _comparer;
  StreamSubscription<T> _subscription;

  SelectPipe(this._store, this._detector);

  dynamic transform(dynamic Function(T state) selector, [bool Function(dynamic a, dynamic b) comparer = identical]) {
    if (_selector == null) {
      _value = selector(_store.state);
      _selector = selector;
      _comparer = comparer;
      _subscription ??= _store.onChange.listen(_onStateChange);
    }

    return _value;
  }

  @override
  void ngOnDestroy() => _subscription?.cancel();

  void _onStateChange(T state) {
    final dynamic value = _selector(state);

    if (!_comparer(value, _value)) {
      _value = value;
      _detector.markForCheck();
    }
  }
}
