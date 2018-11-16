import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
        body1: TextStyle(fontSize: 18),
        caption: TextStyle(fontSize: 18),
        overline: TextStyle(fontSize: 18),
      )),
      home: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter name'),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) return 'Name cannot be blank.';
                      if (value == 'Filip') return 'Unlikely spelling!';
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
