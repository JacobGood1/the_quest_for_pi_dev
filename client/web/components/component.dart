library component;

import '../client.dart';
import '../../../shared/components/shared_component.dart';
import 'dart:convert';

part 'input_manager.dart';
part 'player_movement.dart';

double _stageBoundX = canvas.width.toDouble(),
       _stageBoundY = canvas.height.toDouble();

//var ws = webSocket;

abstract class ComponentData extends SharedComponentData{

}

abstract class PlayerComponentData extends ComponentData{
       bool isKeyBeingPressed(String key);
       bool areAnyOfTheseKeysActive(List<String> keys);
       bool isAnyKeyDown();
}