import 'package:flutter/material.dart';

// This example showcases how extracting widgets into StatelessWidgets
// instead of functions can improve performances, by rebuilding
// only what needs to update when the state changes

class Count extends ValueNotifier<int> {
  ///
  Count() : super(0);
}

class Counter extends InheritedNotifier {
  const Counter({
    super.key,
    required this.count,
    required super.child,
  }) : super(notifier: count);

  final Count count;

  static Count of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<Counter>()!.count;
    } else {
      final counter = context
          .getElementForInheritedWidgetOfExactType<Counter>()!
          .widget as Counter;
      return counter.count;
    }
  }
}

class Inherited extends StatelessWidget {
  const Inherited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Home build');
    return Scaffold(
      body: Center(
        // By extracting Title in a StatelessWidget, Home doesn't rebuild when the counter changes
        child: Title(),
        // Uncommenting this code causes Home to rebuild when the counter changes
        // child: title(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Counter.of(context, listen: false).value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Title');
    return Text('Count ${Counter.of(context).value}');
  }
}

Widget title(BuildContext context) {
  print('build Title');
  return Text('Count ${Counter.of(context).value}');
}
