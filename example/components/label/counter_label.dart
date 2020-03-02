import 'package:angular/angular.dart';

import '../../models/counter_state.dart';
import '../../pipes/counter_select_pipe.dart';

@Component(
  selector: 'counter-label',
  templateUrl: 'counter_label.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
  pipes: [
    CounterSelectPipe,
  ],
)
class CounterLabelComponent {
  int getCount(CounterState state) => state.count;
}
