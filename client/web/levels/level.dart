library levels;

import 'package:stagexl/stagexl.dart' show ResourceManager;
import '../../../shared/levels/level.dart';
import '../client.dart' show stage;
import '../entities/entity.dart';
part 'level1.dart';

ResourceManager resourceManager = new ResourceManager();


abstract class Level extends SharedLevel{
  Level(List<String> assetsToLoad){
    for(num i = 0; i < assetsToLoad.length; i++){
      resourceManager.addBitmapData(assetsToLoad[i], '../web/assets/images/${assetsToLoad[i]}.png');
    }
    resourceManager.load().then((result){
      init();
    });
  }

  void updateSprites(num time){
    entityManager.forEach((entity) => entity.updateAllComponents(time));
  }
}