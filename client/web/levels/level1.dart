part of levels;

class Level1 extends Level{

  Level1():super(['black_mage']) {
  }

  void init() {
    var maggy = new BlackMage(100.0,100.0);
    stage.addChild(maggy);
  }


}