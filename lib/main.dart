import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
        button: TextStyle(fontSize: 18, color: Colors.white),
        body1: TextStyle(fontSize: 18),
        caption: TextStyle(fontSize: 18),
        overline: TextStyle(fontSize: 18),
      )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SizedBox Sample'),
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(),
                SizedBox(height: 200),
                MyOtherButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text = 'Button';

  const MyButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
  }
}

class MyOtherButton extends MyButton {
  @override
  final String text = 'Other Button';
}
