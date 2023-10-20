import 'dart:async';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


class PlayerPaddle extends PositionComponent
 with HasGameRef<FlameGame>, CollisionCallbacks {
 late final RectangleHitbox paddleHitBox;
 late final RectangleComponent paddle;
 
 @override
 FutureOr<void> onLoad() {
 
 final worldRect = gameRef.size.toRect();
 
   size = Vector2(100, 10);
   position.y = worldRect.height * 0.9 - 10;
   position.x = (worldRect.width / 2 - size.x / 2);
   paddle = RectangleComponent(
     size: size,
     paint: Paint()..color = Colors.blue,
   );
 
   paddleHitBox = RectangleHitbox(
     size: size,
   );
 
   addAll([
     paddle,
     paddleHitBox,
   ]);
 
 
 return super.onLoad();
 }
 
 @override
  void update(double dt) {
    super.update(dt);
    position.x = vel;
    print("Vel in Paddle ${vel}");
  }
}
