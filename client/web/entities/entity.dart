library entity;

import 'package:stagexl/stagexl.dart' show Sprite, Bitmap;
import '../levels/level.dart' show resourceManager;
import '../../../shared/components/shared_component.dart';
import 'dart:mirrors';
import '../../../shared/entities/shared_entity.dart';

part 'humanoids/humans/humans.dart';


List<Entity> entityManager = [];

abstract class Entity extends Sprite with SharedEntity{

  Bitmap _appearance;

  Entity(String assetName, num startX, num startY){
    lookAtMe = reflect(this);
    if(!(assetName == '')){
      _appearance = new Bitmap(resourceManager.getBitmapData(assetName));
      pivotX = _appearance.width / 2;
      pivotY = _appearance.height / 2;

      this.addChild(_appearance);
      entityManager.add(this);
    }

    position = new Vector(startX, startY);
    addAllComponentInformation(this);
  }
}
