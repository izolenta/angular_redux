import 'package:angular/angular.dart';

import '../modules/counter_module.dart';
import 'button/counter_button.dart';
import 'label/counter_label.dart';

@Component(
  selector: 'counter-app',
  templateUrl: 'counter_app.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
  providers: [
    counterModule,
  ],
  directives: [
    CounterLabelComponent,
    CounterButtonComponent,
  ],
)
class CounterAppComponent {}
