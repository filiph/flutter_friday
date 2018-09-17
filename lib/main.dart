import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// XXXXXXX copypasted from package:quiver XXXXXXXXX
/// A value that might be absent.
///
/// Use Optional as an alternative to allowing fields, parameters or return
/// values to be null. It signals that a value is not required and provides
/// convenience methods for dealing with the absent case.
///
class Optional<T> extends IterableBase<T> {
  final T _value;

  /// Constructs an empty Optional.
  const Optional.absent() : _value = null;

  /// Constructs an Optional of the given [value].
  ///
  /// Throws [ArgumentError] if [value] is null.
  Optional.of(T value) : this._value = value {
    if (this._value == null) throw new ArgumentError('Must not be null.');
  }

  /// Constructs an Optional of the given [value].
  ///
  /// If [value] is null, returns [absent()].
  const Optional.fromNullable(T value) : this._value = value;

  /// Whether the Optional contains a value.
  bool get isPresent => _value != null;

  /// Gets the Optional value.
  ///
  /// Throws [StateError] if [value] is null.
  T get value {
    if (this._value == null) {
      throw new StateError('value called on absent Optional.');
    }
    return _value;
  }

  /// Executes a function if the Optional value is present.
  void ifPresent(void ifPresent(T value)) {
    if (isPresent) {
      ifPresent(_value);
    }
  }

  /// Execution a function if the Optional value is absent.
  void ifAbsent(void ifAbsent()) {
    if (!isPresent) {
      ifAbsent();
    }
  }

  /// Gets the Optional value with a default.
  ///
  /// The default is returned if the Optional is [absent()].
  ///
  /// Throws [ArgumentError] if [defaultValue] is null.
  T or(T defaultValue) {
    print('defaultValue: $defaultValue');
    print('_value: $_value');
    if (defaultValue == null) {
      throw new ArgumentError('defaultValue must not be null.');
    }
    return _value == null ? defaultValue : _value;
  }

  /// Gets the Optional value, or [null] if there is none.
  T get orNull => _value;

  /// Transforms the Optional value.
  ///
  /// If the Optional is [absent()], returns [absent()] without applying the transformer.
  ///
  /// The transformer must not return [null]. If it does, an [ArgumentError] is thrown.
  Optional<S> transform<S>(S transformer(T value)) {
    return _value == null
        ? new Optional.absent()
        : new Optional.of(transformer(_value));
  }

  @override
  Iterator<T> get iterator =>
      isPresent ? <T>[_value].iterator : new Iterable<T>.empty().iterator;

  /// Delegates to the underlying [value] hashCode.
  int get hashCode => _value.hashCode;

  /// Delegates to the underlying [value] operator==.
  bool operator ==(o) => o is Optional<T> && o._value == _value;

  String toString() {
    print("T: $T");
    print("_value: $_value");
    print("_value.runtimeType: ${_value.runtimeType}");
    print("_value == null: ${_value == null}");
    return _value == null
        ? 'Optional { absent }'
        : 'Optional { value: ${_value} }';
  }
}

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
      return new Optional<A>.absent();
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
    print(absentGetterWithSwitch);
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
