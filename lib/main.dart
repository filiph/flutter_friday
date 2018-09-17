import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyUrlButton(
          'Website',
          enabled: canLaunch('https://flutter.io/'),
          onPressed: () => launch('https://flutter.io/'),
        ),
        MyUrlButton(
          'Email us',
          enabled: canLaunch('mailto:info@example.com'),
          onPressed: () => launch('mailto:info@example.com'),
        ),
        MyUrlButton(
          'Call us',
          enabled: canLaunch('tel:+1-650-000-1842'),
          onPressed: () => launch('tel:+1-650-000-1842'),
        ),
        MyUrlButton(
          'Text us',
          enabled: canLaunch('sms:+1-650-000-1842'),
          onPressed: () => launch('sms:+1-650-000-1842'),
        ),
      ],
    );
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
