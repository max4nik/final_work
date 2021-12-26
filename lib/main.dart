import 'package:flutter/material.dart';
import 'data.dart';

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

  // 0 is grey, 1 is blackgrey 2 is green

  void _changeBehaviour(int e, special_number, counter_list) {
    int indexCurrentElement = e - 1;
    if (colorsList[indexCurrentElement] == 2 || lastClickedElement == indexCurrentElement){
      return;
    }
    lastClickedElement = indexCurrentElement;
    setState(() {
      colorsList[indexCurrentElement] = 1;
      if (indexCurrentElement == special_number) {
        colorsList[indexCurrentElement] = 2;
      }
    });
    var count = colorsList.where((c) => c == 2).toList().length;
    if (count == colorsList.length){
      restartGame();
    }
    clickedNoneSpecialElement(indexCurrentElement);
    print("AFTER " + specialElement.toString() + ' ' + (indexCurrentElement).toString());


  }

  Widget _item(int e, special_number, counter_list) {
    print(colorsList);
    return Container(
      width: 40,
      height: 40,
      child: TextButton(
        onPressed: () {
          _changeBehaviour(e, special_number, counter_list);
        },
        child: Text(colorsList[e - 1] == 1 ? '⠀⠀⠀⠀⠀⠀⠀' : 'Element $e'),
        style: TextButton.styleFrom(
          textStyle: TextStyle(
              backgroundColor: colorsList[e - 1] == 0
                  ? Colors.black26
                  : (colorsList[e - 1] == 1 ? Colors.grey : Colors.green)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var counter_list = [];
    for (int i = 1; i <= colorsLen; i++) {
      counter_list.add(i);
    }
    print(counter_list);
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
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView(
                    children: counter_list
                        .map((e) => (_item(e, specialElement, counter_list)))
                        .toList()))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
