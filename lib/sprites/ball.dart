// ignore_for_file: library_prefixes

import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:game_breakout_task/sprites/brick.dart';
import 'package:game_breakout_task/sprites/player_paddle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

class Ball extends SpriteComponent with HasGameRef, CollisionCallbacks {

  final Vector2 ballSize;
  final Vector2 ballPosition;
  final Vector2 initialVelocity;
  final Vector2 maxVelocity;
  final Vector2 gravity;

  Ball({
    required this.ballSize,
    required this.ballPosition,
    required this.initialVelocity,
    required this.maxVelocity,
    required this.gravity,
  });

  late ShapeHitbox hitbox;
  bool collided = false;

  Vector2 velocity = Vector2.zero();
  late double _dt;


  @override
  Future onLoad() async{
    await super.onLoad();
    sprite = await game.loadSprite('game/ball.png');
    size = ballSize;
    position = ballPosition;

    hitbox = CircleHitbox();
    add(hitbox);
    _dt = (game.size.y/(8*3)/2)/100;
    velocity = initialVelocity;
  }

  @override
  void update(dt){
    if((size + position + velocity*_dt).x >= game.size.x || (position + velocity*_dt).x <= 0){ // checks for collision with vertical walls
      _reflect(Surface.x);
    }
    if((size + position + velocity*_dt).y >= game.size.y || (position + velocity*_dt).y <= 0){ // checks for collision with horizontal walls
      _reflect(Surface.y);
    }
    // velocity += gravity;
    position += velocity*_dt;
    super.update(dt);

  }


  void updateBallTrajectory(Vector2 collisionPoint, Rect bodyRect) {
    final isLeftHit = collisionPoint.x == bodyRect.left;
    final isRightHit = collisionPoint.x == bodyRect.right;
    final isTopHit = collisionPoint.y == bodyRect.bottom;
    final isBottomHit = collisionPoint.y == bodyRect.top;

    final isLeftOrRight = isLeftHit || isRightHit;
    final isTopOrBottom = isTopHit || isBottomHit;

    if (isLeftOrRight) {
      velocity.x = -velocity.x;
      velocity.y = velocity.y;
    }
    if (isTopOrBottom) {
      velocity.x = velocity.x;
      velocity.y = -velocity.y;
    }
  }

  void get _playCollisionAudio{
    FlameAudio.play("assets_audio_ball_hit.wav");
  }

  void get _playPaddleCollisionAudio{
    FlameAudio.play("collision.wav");
  }
  @override
  void onCollision(Set<Vector2> intersect, PositionComponent comp){
    if(!collided){
      collided = true;
      if(comp is PlayerPaddle){
        // updateBallTrajectory(intersect.last, comp.paddleHitBox.toAbsoluteRect());
        _rebound(intersect, comp);
        _playCollisionAudio;
        if((velocity.x+comp.paddleBoost).isNegative){
          velocity.x = max(-maxVelocity.x,(velocity.x+comp.paddleBoost));
        }else{
          velocity.x = min(maxVelocity.x, velocity.x+comp.paddleBoost);
        }
      }else if(comp is Brick){
        // final brickRect = comp.brick;
          //updateBallTrajectory(intersect.last, comp.brick.toAbsoluteRect());
          _playCollisionAudio;
        _rebound(intersect, comp);
      }
    }
    super.onCollision(intersect,comp);
  }

  void _rebound(Set<Vector2> ip, PositionComponent other){
    if(ip.length == 1){
      sideReflection(ip.first, other);
    } else {
      final ipList = ip.toList();
      final avg = (ipList[0] + ipList[1]) / 2;
      if(ipList[0].x == ipList[1].x || ipList[0].y == ipList[1].y){
        sideReflection(avg, other);
      } else {
        cornerReflection(other, avg);
      }
    }
  }

  // for reflection on vertical or horizontal sides
  void sideReflection(Vector2 ip, PositionComponent other) {
    final isTop = (ip.y - other.position.y).abs() < 5;
    final isBottom = (ip.y - (other.position.y + other.size.y)).abs() < 5;
    final isLeft = (ip.x - other.position.x).abs() < 5;
    final isRight = (ip.x - (other.position.x + other.size.x)).abs() < 5;
    if (isTop || isBottom) {
      _reflect(Surface.y);
    } else if (isLeft || isRight) {
      _reflect(Surface.x);
    }
  }

  // for reflection on corners
  void cornerReflection(PositionComponent other, Vector2 avg) {
    _reflect(Surface.x);
    _reflect(Surface.y);
  }

  @override
  void onCollisionEnd(PositionComponent other){
    if(collided){
      collided = false;
    }
    super.onCollisionEnd(other);
  }

  // reflects the direction of the ball based on the collision surface
  void _reflect(Surface surface){
    if(surface == Surface.x){
      velocity.x *= -1;
    }
    else{
      velocity.y *= -1;
    }
  }


}

enum Surface{x,y}

// class Ball extends CircleComponent
//   with HasGameRef<BreakoutGame>, CollisionCallbacks {
//
//     void get _playCollisionAudio {
//       FlameAudio.play("assets_audio_ball_hit.wav");
//     }
//
//     @override
//     @mustCallSuper
//     void onCollisionStart(
//     Set<Vector2> intersectionPoints,
//       PositionComponent other,
//     ) {
//       super.onCollisionStart(intersectionPoints, other);
//       final collisionPoint = intersectionPoints.last;
//
//       if (other is ScreenHitbox) {
//
//         if (collisionPoint.y == 0) {
//             velocity.x = velocity.x;
//             velocity.y = -velocity.y;
//             _playCollisionAudio;
//           }
//
//         if (collisionPoint.x == 0) {
//               velocity.x = -velocity.x;
//               velocity.y = velocity.y;
//             _playCollisionAudio;
//             }
//
//         if (collisionPoint.x.round() == gameRef.size.x.round()) {
//               velocity.x = -velocity.x;
//               velocity.y = velocity.y;
//             _playCollisionAudio;
//           }
//
//         if (collisionPoint.y.round() == gameRef.size.y.round()) {
//               velocity.x = velocity.x;
//               velocity.y = -velocity.y;
//             _playCollisionAudio;
//           }
//         }
//
//         // if (other is PlayerPaddle) {
//         //   // final paddleRect = other.paddle.toAbsoluteRect();
//         //
//         //   updateBallTrajectory(collisionPoint, paddleRect);
//         // _playCollisionAudio;
//         // }
//         if (other is Brick ) {
//           final brickRect = other.brick.toAbsoluteRect();
//
//           updateBallTrajectory(collisionPoint, brickRect);
//           _playCollisionAudio;
//         }
//
//     }
//
//     void updateBallTrajectory(Vector2 collisionPoint, Rect bodyRect) {
//       final isLeftHit = collisionPoint.x == bodyRect.left;
//       final isRightHit = collisionPoint.x == bodyRect.right;
//       final isTopHit = collisionPoint.y == bodyRect.bottom;
//       final isBottomHit = collisionPoint.y == bodyRect.top;
//
//       final isLeftOrRight = isLeftHit || isRightHit;
//       final isTopOrBottom = isTopHit || isBottomHit;
//
//       if (isLeftOrRight) {
//           velocity.x = -velocity.x;
//           velocity.y = velocity.y;
//         }
//       if (isTopOrBottom) {
//           velocity.x = velocity.x;
//           velocity.y = -velocity.y;
//         }
//     }
//
//     Ball() {
//       paint = Paint()..color = Colors.white;
//       radius = 10;
//     }
//
//
//     late Vector2 velocity;
//
//     static const double speed = 150;
//
//     static const degree = math.pi / 180;
//
//
//     @override
//     Future<void> onLoad() {
//       _resetBall;
//     final hitBox = CircleHitbox(
//         radius: radius,
//       );
//
//       addAll([
//         hitBox,
//       ]);
//
//     return super.onLoad();
//     }
//
//     @override
//     void update(double dt) {
//       super.update(dt);
//       position += velocity * dt;
//     }
//
//
//
//     void get _resetBall {
//       position = gameRef.size / 2;
//       final spawnAngle = getSpawnAngle;
//
//       final vx = math.cos(spawnAngle * degree) * speed;
//       final vy = math.sin(spawnAngle * degree) * speed;
//         velocity = Vector2(
//           vx,
//           vy,
//         );
//     }
//
//
//     double get getSpawnAngle {
//       final sideToThrow = math.Random().nextBool();
//
//       final random = math.Random().nextDouble();
//       final spawnAngle = sideToThrow ? lerpDouble(45, 90, random)! : lerpDouble(90, 135, random)!;
//
//       return spawnAngle;
//     }
//  }