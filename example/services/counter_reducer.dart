import 'package:redux/redux.dart';

import '../actions/increment_action.dart';
import '../models/counter_state.dart';

class CounterReducer {
  Reducer<CounterState> _reducer;

  CounterReducer() {
    _reducer = combineReducers([
      TypedReducer(_onIncrement),
    ]);
  }

  CounterState getState(CounterState state, Object action) {
    return _reducer(state, action);
  }

  CounterState getInitialState() {
    return CounterState(0);
  }

  CounterState _onIncrement(CounterState state, IncrementAction action) {
    return CounterState(state.count + 1);
  }
}
