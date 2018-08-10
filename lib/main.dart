import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

final bigStyle = TextStyle(
  fontSize: 32.0,
  color: Colors.black87,
);

int fibonacci(int n) {
  return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Draggable'),
          ),
          body: MyHomePage(),
//          floatingActionButton: FloatingActionButton(
//            onPressed: () {},
//            child: Icon(Icons.swap_vert),
//          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 24.0, inherit: true, color: Colors.black),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[












          Draggable(
            feedback: Material(
              color: Colors.transparent,
              child: Text("Oooooh!"),
            ),
            child: Text("Drag me"),
            data: 42,
          ),

          Divider(height: 50.0),

          DragTarget<int>(
            builder: (context, candidateData, rejectedData) =>
                candidateData.isEmpty
                    ? Text("Hungry for data")
                    : Text("Looking forward to $candidateData"),
          ),






        ],
      )),
    );
  }
}
