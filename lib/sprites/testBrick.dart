import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'ball.dart';

enum BrokenBrick {normal, broken}

class TestBrick extends SpriteComponent with HasGameRef, CollisionCallbacks{
  final Vector2 brickSize;
  final Vector2 brickPosition;

  late BrokenBrick brokenBrick;
  late ShapeHitbox hitbox;

  bool _collided = false;

  TestBrick({
    required this.brickSize,
    required this.brickPosition,

  });

  @override
  Future onLoad() async{
    super.onLoad();
    sprite = await game.loadSprite("game/blue.png");
    size = brickSize;
    position = brickPosition;

    hitbox = RectangleHitbox();
    add(hitbox);
  }

  @override
  Future<void> onCollision(Set<Vector2> intersecting, PositionComponent comp) async{
    if(comp is Ball && !_collided){
      _collided = true;
      removeFromParent();
    }

    super.onCollision(intersecting, comp);
  }

  @override
  Future onCollisionEnd(PositionComponent comp)async{
    if(_collided){
      _collided = false;
    }
    super.onCollisionEnd(comp);
  }

  @override
  void onRemove(){
    super.onRemove();
  }

}