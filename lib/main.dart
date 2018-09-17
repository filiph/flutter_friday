import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/core.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(new MyApp());
}

final absent = const Optional<A>.absent();

var predeterminedResult = Predetermination.none;

final _failureChance = Optional.of(A("failure"));

final _successChance = Optional.of(A("success"));

Optional<A> get absentGetter => const Optional<A>.absent();

Optional<A> get absentGetterWithSwitch {
  switch (predeterminedResult) {
    case Predetermination.none:
      return const Optional<A>.absent();
    case Predetermination.failureGuaranteed:
      return _failureChance;
    case Predetermination.successGuaranteed:
      return _successChance;
    default:
      throw ArgumentError(predeterminedResult);
  }
}

class A {
  final String text;

  A(this.text);
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
            title: Text('Crashes in production'),
          ),
          body: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(absent.or(A("inline")).text),
      Text(absentGetter.or(A("inline")).text),
      Text(absentGetterWithSwitch.or(A("inline")).text),
    ]);
  }
}

enum Predetermination {
  none,
  failureGuaranteed,
  successGuaranteed,
}
