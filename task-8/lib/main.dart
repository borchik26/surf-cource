import 'package:flutter/material.dart';

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
      home: HomePageStateful(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key, required this.title});

  final String title;

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  int _counter = 0;
  int _incrementPressCount = 0;
  int _decrementPressCount = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _incrementPressCount++;
      print("количестве нажатий на + $_incrementPressCount");
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _decrementPressCount++;
        print("количестве нажатий на - $_decrementPressCount");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Вы нажимали на кнопку уже столько раз:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Увеличивающие прессы: $_incrementPressCount'),
                    Text('Уменьшающие прессы: $_decrementPressCount'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Увеличение',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Уменьшение',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
