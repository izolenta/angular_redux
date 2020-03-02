import 'package:angular/angular.dart';
import 'package:angular/src/core/change_detection/change_detector_ref.dart';
import 'package:angular_redux/angular_redux.dart';
import 'package:redux/src/store.dart';

import '../models/counter_state.dart';

@Pipe('select', pure: false)
class CounterSelectPipe extends SelectPipe<CounterState> {
  CounterSelectPipe(Store<CounterState> store, ChangeDetectorRef detector) : super(store, detector);
}
