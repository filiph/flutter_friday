//
//
//class Shape {
//  num area;
//}
//
//class Circle extends Shape {
//  num radius;
//}
//
//Shape doSomethingWithShape(dynamic s) {
//  List<List<Shape>> shapes = [[new Shape(), Shape()]];
//
//}
//
//class ShapeBeautifier {
//  ShapeBeautifier(this.func);
//
//  ShapeTransformer func;
//}
//
//class BetterShapeBeautifier extends ShapeBeautifier {
//  BetterShapeBeautifier(CircleTransformer func) : super(func);
//}
//
//typedef ShapeTransformer = Shape Function(Shape);
//typedef CircleTransformer = Circle Function(Circle);
//
//void main() {
//  var circle = Circle();
//  List<Shape> list = [Circle()];
//
//  list.map((Circle c) => c.radius);
//
//  doSomethingWithShape(circle);
//
//  list.map(doSomethingWithShape);
//
//
//}