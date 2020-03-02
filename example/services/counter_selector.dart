import 'package:reselect/reselect.dart';

import '../models/counter_state.dart';

class CounterSelector {
  final Selector<CounterState, int> getCount = createSelector1(
    (CounterState state) => state.count,
    (int count) => count,
  );
}
