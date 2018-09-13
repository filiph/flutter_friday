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
//          appBar: AppBar(
//            title: Text('Draggable'),
//          ),
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
      style: TextStyle(fontSize: 16.0, inherit: true, color: Colors.black),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 200.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Placeholder',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum at metus dolor. Morbi lectus lectus, tincidunt eu semper eu, tempor et dolor. '),
                ],
              )),
              SizedBox(
                width: 16.0,
              ),
              Placeholder(
                fallbackWidth: 150.0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
