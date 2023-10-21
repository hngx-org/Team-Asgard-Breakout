import 'dart:async';

import 'package:flame/events.dart';
import 'package:flutter/gestures.dart';
import 'package:game_breakout_task/breakout_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';


class PlayerPaddle extends SpriteComponent
 with HasGameRef<BreakoutGame>, CollisionCallbacks, DragCallbacks{
 PlayerPaddle({
   required this.paddleSize,
   required this.paddlePosition,
});

 final Vector2 paddleSize;
 final Vector2 paddlePosition;

  late ShapeHitbox paddleHitBox;
  double paddleBoost = 0;

 
 @override
 FutureOr<void> onLoad() async {
   await super.onLoad();
 sprite = await game.loadSprite("game/pad.png");
 // final worldRect = gameRef.size.toRect();
 
   size = paddleSize;
   position= paddlePosition;
   // paddle = RectangleComponent(
   //   size: size,
   //   paint: Paint()..color = Colors.blue,
   // );

   // paddle = sprite as RectangleComponent;
 
   paddleHitBox = RectangleHitbox();
 
   add(paddleHitBox);

 }
 
 @override
  void onDragUpdate(DragUpdateEvent event){
   super.onDragUpdate(event);
   final newPosition = position.x +event.delta.x;
   position.x = newPosition;
   paddlePosition.x = newPosition;
   paddleBoost = event.delta.x*4.0;
 }
 @override
  void onDragEnd(DragEndEvent event){
   super.onDragEnd(event);
   paddleBoost = 0;
 }
}
