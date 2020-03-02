import 'package:angular/angular.dart';
import 'package:redux/redux.dart';

import '../../actions/increment_action.dart';
import '../../models/counter_state.dart';

@Component(
  selector: 'counter-button',
  templateUrl: 'counter_button.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class CounterButtonComponent {
  final Store<CounterState> _store;

  CounterButtonComponent(this._store);

  void onClick() {
    _store.dispatch(IncrementAction());
  }
}
