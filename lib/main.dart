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

class InheritedColor extends InheritedWidget {
  final Color color;

  InheritedColor({
    Key key,
    @required this.color,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedColor oldWidget) => oldWidget.color != color;

  static InheritedColor of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedColor);
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
    return InheritedColor(
      color: Colors.deepOrange,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('OrientationBuilder'),
            ),
            body: MyHomePage(),
            floatingActionButton: FloatingActionButton(
              onPressed: _changeColor,
              child: Icon(Icons.swap_vert),
            ),
          )),
    );
  }

  void _changeColor() {
    setState(() {});
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
              color: InheritedColor.of(context).color,
            ),
          );
        },
      ),
    );
  }
}
