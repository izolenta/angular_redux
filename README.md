# angular_redux.dart

Bindings between Redux and Angular Dart.

## Quick Start

Create a factory for your Store:

```dart
class CounterStoreFactory {
  static Store<CounterState> createStore(/* ... */) {
    return Store(/* ... */); 
  }
}
```

Use `FactoryProvider` to make the Store injectable:

```dart
@Component(
  /* ... */
  providers: [
    /* ... */
    FactoryProvider(Store, CounterStoreFactory.createStore)
  ],
)
class CounterAppComponent {
  /* ... */
}
```

Extend base `SelectPipe` to specify the State type:

```dart
@Pipe('select', pure: false)
class CounterSelectPipe extends SelectPipe<CounterState> {
  CounterSelectPipe(Store<CounterState> store, ChangeDetectorRef detector) : super(store, detector);
}
```

Use this pipe in your components:  

```dart
@Component(
  /* ... */
  pipes: [
    CounterSelectPipe,
  ],
)
class CounterAppComponent {
  /* ... */
}
```

Add a `selector` method in the component to select a value from the Store:

```dart
class CounterAppComponent {
  /* ... */

  int getCount(CounterState state) => state.count;
}
```

Use `select` pipe in Angular templates to extract a value from the Store:

```html
<div>
  {{ getCount | select }}
</div>
```

Component will be marked for check automatically when the State changes and the `selector` returns new value.
