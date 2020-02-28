import 'package:redux/redux.dart';
import 'package:rxdart/transformers.dart';

class NgStore<T> {
  final Store<T> _store;

  NgStore(this._store);

  T get state => _store.state;

  Stream<S> select<S>(S Function(T state) selector) {
    return _store.onChange
      .map(selector)
      .transform(StartWithStreamTransformer(selector(state)))
      .distinct();
  }

  dynamic dispatch(dynamic action) {
    return _store.dispatch(action);
  }
}
