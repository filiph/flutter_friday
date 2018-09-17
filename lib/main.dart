import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(new MyApp());
}

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
        color: Colors.white,
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColorBrightness: Brightness.light,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Draggable'),
          ),
          body: MyHomePage(),
        ));
  }
}

abstract class Action<T> {
  void doSomething(T object);
}

class IntAction extends Action<int> {
  @override
  void doSomething(int object) {
    print("number: $object");
  }
}

class NullAction extends Action<Null> {
  @override
  void doSomething(Null object) {
    print("null");
  }
}

class VoidAction extends Action<void> {
  @override
  void doSomething(void object) {
    print("void");
  }
}

final intAction = IntAction();

final nullAction = NullAction();

final voidAction = VoidAction();

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      intAction is Action<Null>
          ? Text("intAction is Action<Null>")
          : Text("intAction is not Action<Null>"),
      nullAction is Action<Null>
          ? Text("nullAction is Action<Null>")
          : Text("nullAction is not Action<Null>"),
      voidAction is Action<Null>
          ? Text("voidAction is Action<Null>")
          : Text("voidAction is not Action<Null>"),
      intAction is Action<void>
          ? Text("intAction is Action<void>")
          : Text("intAction is not Action<void>"),
      nullAction is Action<void>
          ? Text("nullAction is Action<void>")
          : Text("nullAction is not Action<void>"),
      voidAction is Action<void>
          ? Text("voidAction is Action<void>")
          : Text("voidAction is not Action<void>"),
      intAction is Action<Object>
          ? Text("intAction is Action<Object>")
          : Text("intAction is not Action<Object>"),
      nullAction is Action<Object>
          ? Text("nullAction is Action<Object>")
          : Text("nullAction is not Action<Object>"),
      voidAction is Action<Object>
          ? Text("voidAction is Action<Object>")
          : Text("voidAction is not Action<Object>"),
    ]);
  }
}

class MyUrlButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Future<bool> enabled;

  MyUrlButton(
    this.text, {
    Key key,
    this.onPressed,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: enabled,
      initialData: false,
      builder: (context, snapshot) {
        return MaterialButton(
          onPressed: snapshot.data ? onPressed : null,
          child: Text(text),
        );
      },
    );
  }
}
