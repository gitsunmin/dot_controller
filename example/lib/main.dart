import 'package:flutter/material.dart';

import 'package:dot/dot.dart';
import 'package:dot/dragController/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _initCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Counter',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Dot(
            draggingBackgroundColor: Colors.amber,
            stickBackgroundColor: Colors.amber,
            actions: [
              ActionProp(
                icon: const Icon(Icons.add),
                backgroundColor: Colors.white,
                borderColor: Colors.black,
                onAccept: _incrementCounter,
              ),
              ActionProp(
                icon: const Icon(Icons.remove),
                backgroundColor: Colors.red,
                borderColor: Colors.black,
                onAccept: _decrementCounter,
              ),
              ActionProp(
                icon: const Icon(Icons.backspace),
                backgroundColor: Colors.yellow,
                borderColor: Colors.black,
                onAccept: _initCounter,
              ),
            ],
          )
        ],
      ),
    );
  }
}
