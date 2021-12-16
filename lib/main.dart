import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Final Flutter Work'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  // 0 is grey, 1 is blackgrey 2 is green
  List<int> colors = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  void _changeBehaviour(e, special_number, counter_list) {

    print(colors);
    print(special_number);
    setState(() {
      colors[e - 1] == 1;
      if (counter_list[e - 1] == special_number) {
        colors[e - 1] == 2;
      }
    });
    var count = colors.where((c) => c == 2).toList().length;
    if (count == colors.length){
      colors = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    }
  }

  Widget _item(int e, special_number, counter_list) {
    return Container(
      width: 40,
      height: 40,
      child: TextButton(
        onPressed: () {
          _changeBehaviour(e, special_number, counter_list);
        },
        child: Text(colors[e - 1] == 1 ? '------------------' : 'Element $e'),
        style: TextButton.styleFrom(
          textStyle: TextStyle(
              backgroundColor: colors[e - 1] == 0
                  ? Colors.black26
                  : (colors[e - 1] == 1 ? Colors.grey : Colors.green)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int special_number = random.nextInt(10) + 1;
    for (int i = 1; i <= 10; i++) {
      if (colors[i - 1] == 2){
        special_number = random.nextInt(10) + 1;
      }
    }
    var counter_list = [];
    for (int i = 1; i <= special_number; i++) {
      counter_list.add(i);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                    children: counter_list
                        .map((e) => (_item(e, special_number, counter_list)))
                        .toList()))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
