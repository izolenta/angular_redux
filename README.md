# angular_redux.dart

Bindings between Redux and Angular Dart.

## Quick Start

Add a `Store<T>` factory:

```dart
Store<CounterState> createStore() => Store();
```

Add a `NgStore<T>` factory:

```dart
NgStore<CounterState> createNgStore(Store<CounterState> store) => NgStore(store);
```

Make `Store<T>` and `NgStore<T>` injectable:

```dart
Module(
  provides: [
    FactoryProvider(Store, createStore),
    FactoryProvider(NgStore, createNgStore),
  ],
)
```

Inject `NgStore<T>` into a component:

```dart
final NgStore<CounterState> _store;

CounterApp(this._store);
```

Use `select<S>` function to transform state into stream:

```dart
Stream<int> count;

void ngOnInit() {
  count = _store.select((state) => state.count);
}
```

Use `AsyncPipe` to render the stream in the template:

```html
<div>
  {{ count | async }}
</div>
```

Use `dispatch` to dispatch an action to the underlying store:

```dart
void onClick() {
  _store.dispatch(IncrementAction());
}
```
