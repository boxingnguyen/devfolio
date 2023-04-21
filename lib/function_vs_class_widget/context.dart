import 'package:flutter/material.dart';

// This example showcases how by using functions instead of StatelessWidgets,
// this can cause bugs when using InheritedWidgets

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('this build method is called only once');
    return Counter(
      count: Count(),
      child: MaterialApp(
//         home: Home(),
        // Uncomment to make your app crash
        // And if you fix the error, rebuilding the counter will rebuild MyApp
        home: home(context),
      ),
    );
  }
}

class Count extends ValueNotifier<int> {
  Count() : super(0);
}

class Counter extends InheritedNotifier {
  const Counter({
    super.key,
    required this.count,
    required super.child,
  }) : super(notifier: count);

  final Count count;

  static Count of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Counter>()!.count;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Home is re-executed without re-executing MyApp');
    return Scaffold(
      body: Center(
        child: Text('Count ${Counter.of(context).value}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Counter.of(context).value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget home(BuildContext context) {
  // Throws by default
  // To fix, either use a Builder (which wouldn't solve the AnimatedSwitcher issue in https://dartpad.dev/1870e726d7e04699bc8f9d78ba71da35)
  // Alternatively, you could move Counter() above MyApp, but then MyApp would
  // rebuild whenever the counter changes
  return Scaffold(
    body: Center(
      child: Text('Count ${Counter.of(context).value}'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Counter.of(context).value++,
      child: const Icon(Icons.add),
    ),
  );
}
