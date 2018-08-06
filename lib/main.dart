import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

int fibonacci(int n) {
  return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
}

final bigStyle = TextStyle(
  fontSize: 32.0,
  color: Colors.black87,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('OrientationBuilder'),
            ),
            body: MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Text(
            orientation.toString(),
            style: TextStyle(
              fontSize: 32.0,
              color: orientation == Orientation.landscape
                  ? Colors.red
                  : Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
