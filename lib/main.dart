import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

int fibonacci(int n) {
  return n < 2 ? n : (fibonacci(n - 1) + fibonacci(n - 2));
}

final defaultStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black87,
);

class FibonnaciWidget extends StatelessWidget {
  final int n;

  FibonnaciWidget(
    this.n, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final futureBuilder = FutureBuilder(
      future: compute(fibonacci, n),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Text("${snapshot.data}");
      },
    );
    return Padding(
        padding: const EdgeInsets.all(8.0),
//        decoration:
//            BoxDecoration(border: Border.all(width: 6.0, color: Colors.red)),
        child: futureBuilder);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Fibonacci'),
            ),
            body: MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  static void noOp() {}

  @override
  Widget build(BuildContext context) {
    Widget buildButton(String text) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: noOp,
            child: Text(text),
          ),
        );

    final myFocusNode = FocusNode();

// Will auto-focus when shown.
TextField(autofocus: true);

// Can be focused programmatically.
TextField(focusNode: myFocusNode);

// Here's how:
MaterialButton(
  onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
  child: Text('Focus the text field')
);

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton("Rock"),
          buildButton("Pop"),
          PopupMenuButton(
            onSelected: (value) => print(value),
            itemBuilder: (context) => [
                  PopupMenuItem(value: 1, child: Text('Baby Metal')),
                  PopupMenuItem(value: 2, child: Text('Math Rock')),
                  PopupMenuItem(value: 3, child: Text('Nintendocore')),
                ],
          ),
        ],
      ),
    );
  }

  Widget _buildSquare(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute<void>(
                builder: (context) => _buildNewScreen(context, index)));
      },
      child: Center(
        child: FibTextHero(
          n: index,
        ),
      ),
    );
  }

  Widget _buildNewScreen(BuildContext context, int n) {
    return Scaffold(
        appBar: AppBar(),
        body: DefaultTextStyle(
          style: defaultStyle,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FibTextHero(n: n),
              Text(' = '),
              FibonnaciWidget(n),
            ],
          )),
        ));
  }
}

class FibTextHero extends StatelessWidget {
  const FibTextHero({Key key, this.n, this.onTap, this.width})
      : super(key: key);

  final int n;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: n,
        child: Material(
          textStyle: defaultStyle,
          color: Colors.transparent,
          child: Text('fib($n)'),
        ),
      ),
    );
  }
}

class MyMinimalScaffold extends StatelessWidget {
  final Widget child;

  MyMinimalScaffold({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData.fromWindow(ui.window),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: new TextStyle(color: Colors.black87, fontSize: 40.0),
          child: Container(
            color: Colors.white,
            child: child,
          ),
        ),
      ),
    );
  }
}

//class Margin {}
//
//class SomeWidget implements Widget {
//  EdgeInsetsGeometry padding;
//  EdgeInsetsGeometry margin;
//  Widget child;
//
//  SomeWidget({
//    this.padding,
//    this.margin,
//    this.child,
//  });
//}
//
//something() {
//  return SomeWidget(
//    margin: const EdgeInsets.all(32.0),
//    padding: const EdgeInsets.all(16.0),
//    child: Text("Hello"),
//  );
//}
//
//something2() {
//  return SomeWidget(
//    child: Padding(
//      padding: const EdgeInsets.all(16.0),
//      child: Text("Hello"),
//    ),
//  );
//
//  SomeWidget(
//    margin: const EdgeInsets.all(32.0),
//    padding: const EdgeInsets.all(16.0),
//  );
//}
//
//something3() {
//  return Padding(
//    padding: const EdgeInsets.all(32.0),
//    child: SomeWidget(
//      child: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Text("Hello"),
//      ),
//    ),
//  );
//
//  SomeWidget(
//    margin: const EdgeInsets.all(32.0),
//    padding: const EdgeInsets.all(16.0),
//  );
//}


class AnimatedWidget extends StatefulWidget {
  @override
  _AnimatedWidgetState createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
