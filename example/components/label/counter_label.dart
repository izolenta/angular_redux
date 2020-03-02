import 'package:angular/angular.dart';

import '../../pipes/counter_select_pipe.dart';
import '../../services/counter_selector.dart';

@Component(
  selector: 'counter-label',
  templateUrl: 'counter_label.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
  pipes: [
    CounterSelectPipe,
  ],
)
class CounterLabelComponent {
  final CounterSelector selector;

  CounterLabelComponent(this.selector);
}
