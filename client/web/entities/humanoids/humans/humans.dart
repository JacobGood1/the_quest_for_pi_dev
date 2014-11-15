part of entity;

class BlackMage extends Entity with Movement{

  BlackMage(x,y):super('black_mage',x,y) {
    movementSpeed = 10.0;
    moveRight();
    print(velocity.x);
  }
}