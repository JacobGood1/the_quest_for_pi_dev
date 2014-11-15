library component;



import '../client.dart' show canvas, stage, Point;

part 'physics/vector.dart';

double _stageBoundX = canvas.width.toDouble(),
       _stageBoundY = canvas.height.toDouble();

abstract class ComponentData{

}