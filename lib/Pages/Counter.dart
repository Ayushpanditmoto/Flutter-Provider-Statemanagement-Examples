// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/CounterProvider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Counter build');
    final CounterProv = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(builder: (context, CounterProvider counterProv, child) {
              return Text(
                counterProv.count.toString(),
                style: const TextStyle(fontSize: 30),
              );
            }),
            Text(
              CounterProv.count.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterProv.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
