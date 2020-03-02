import 'package:angular/angular.dart';
import 'package:redux/redux.dart';

import '../services/counter_reducer.dart';
import '../services/counter_selector.dart';
import '../services/counter_store_factory.dart';

const counterModule = Module(provide: [
  ClassProvider(CounterReducer),
  ClassProvider(CounterSelector),
  FactoryProvider(Store, CounterStoreFactory.createStore),
]);
