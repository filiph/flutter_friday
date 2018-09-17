import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

final someVariable = 0;

final _one = Optional.of(MyClass("one"));

/// When this function gets any simpler, the bug doesn't seem to materialize.
Optional<MyClass> getOptional() {
  switch (someVariable) {
    case 0:
      return new Optional<MyClass>.absent();
    case 1:
      return _one;
  }
}

/// The value being wrapped by [Optional] must be a non-primitive value.
class MyClass {
  final String text;

  MyClass(this.text);
}

/// This is `package:quiver`'s `Optional` class, simplified as much
/// as possible.
class Optional<T> {
  final T _value;

  const Optional.absent() : _value = null;

  Optional.of(this._value);

  String toString() {
    final buf = StringBuffer();
    buf.writeln("T: $T");
    buf.writeln("_value: $_value");
    buf.writeln("_value.runtimeType: ${_value.runtimeType}");
    buf.writeln("_value == null: ${_value == null}");
    buf.write(_value == null
        ? 'Optional { absent }'
        : 'Optional { non-null value: ${_value} }');
    return buf.toString();
  }
}

// ---- Flutter-specific code

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final optionalInstance = getOptional();
    final string = optionalInstance.toString();

    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(string)),
      ),
    );
  }
}
