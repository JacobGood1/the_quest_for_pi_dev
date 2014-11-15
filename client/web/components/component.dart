library component;

import '../client.dart' show canvas, stage;
import '../../../shared/components/shared_component.dart';
import 'dart:math';


double _stageBoundX = canvas.width.toDouble(),
       _stageBoundY = canvas.height.toDouble();

abstract class ComponentData extends SharedComponentData{

}