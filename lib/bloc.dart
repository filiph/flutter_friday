import 'package:meta/meta.dart';

// TODO: XXX START HERE - take bloc_complex and rewrite to simple classes

class SomeCommand {

}

class Observable<T> {

}

class Input<T> {

}

class Output<T> {
  void publish(T value) => UnimplementedError();
}

@Bloc(

)
class SourceGenDirtyCheckBlocTest {

//   TODO: do we need a field or can we just have `refresh(SomeCommand cmd)`?
//  Input<SomeCommand> get refresh;

  // TODO: probably a bad idea. we might want to do at least a little bit of RX
  void refresh(SomeCommand command) {
    articles.addAll([1, 2, 3]);
  }

  List<int> articles;
}


class Bloc {
  const Bloc();
}
