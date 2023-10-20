// ignore_for_file: library_prefixes

import 'dart:math' as math;
import 'dart:ui';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:game_breakout_task/brick.dart';
import 'package:game_breakout_task/player_paddle.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
 
class Ball extends CircleComponent
  with HasGameRef<BreakoutGame>, CollisionCallbacks {

    void get _playCollisionAudio {
      FlameAudio.play("assets_audio_ball_hit.wav");
    }

    @override
    @mustCallSuper
    void onCollisionStart(
    Set<Vector2> intersectionPoints,
      PositionComponent other,
    ) {
      super.onCollisionStart(intersectionPoints, other);
      final collisionPoint = intersectionPoints.last;

      if (other is ScreenHitbox) {

        if (collisionPoint.y == 0) {
            velocity.x = velocity.x;
            velocity.y = -velocity.y;
            _playCollisionAudio;
          }

        if (collisionPoint.x == 0) {
              velocity.x = -velocity.x;
              velocity.y = velocity.y;
            _playCollisionAudio;
            }

        if (collisionPoint.x.round() == gameRef.size.x.round()) {
              velocity.x = -velocity.x;
              velocity.y = velocity.y;
            _playCollisionAudio;
          }

        if (collisionPoint.y.round() == gameRef.size.y.round()) {
              velocity.x = velocity.x;
              velocity.y = -velocity.y;
            _playCollisionAudio;
          }
        }
      
        if (other is PlayerPaddle) {
          final paddleRect = other.paddle.toAbsoluteRect();
          
          updateBallTrajectory(collisionPoint, paddleRect);
        _playCollisionAudio;
        }
        if (other is Brick ) {
          final brickRect = other.brick.toAbsoluteRect();
          
          updateBallTrajectory(collisionPoint, brickRect);
          _playCollisionAudio;
        }
      
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
    
    Ball() {
      paint = Paint()..color = Colors.white;
      radius = 10;
    }
    

    late Vector2 velocity;

    static const double speed = 150;

    static const degree = math.pi / 180;
    

    @override
    Future<void> onLoad() {
      _resetBall;
    final hitBox = CircleHitbox(
        radius: radius,
      );
    
      addAll([
        hitBox,
      ]);
    
    return super.onLoad();
    }
    
    @override
    void update(double dt) {
      super.update(dt);
      position += velocity * dt;
    }
    
    

    void get _resetBall {
      position = gameRef.size / 2;
      final spawnAngle = getSpawnAngle;
    
      final vx = math.cos(spawnAngle * degree) * speed;
      final vy = math.sin(spawnAngle * degree) * speed;
        velocity = Vector2(
          vx,
          vy,
        );
    }
    

    double get getSpawnAngle {
      final sideToThrow = math.Random().nextBool();
      
      final random = math.Random().nextDouble();
      final spawnAngle = sideToThrow ? lerpDouble(45, 90, random)! : lerpDouble(90, 135, random)!;
      
      return spawnAngle;
    }
 }