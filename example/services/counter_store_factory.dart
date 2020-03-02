import 'package:redux/redux.dart';

import '../models/counter_state.dart';
import 'counter_reducer.dart';

class CounterStoreFactory {
  static Store<CounterState> createStore(CounterReducer reducer) {
    return Store(
      reducer.getState,
      initialState: reducer.getInitialState(),
      distinct: true,
      syncStream: true,
    );
  }
}
