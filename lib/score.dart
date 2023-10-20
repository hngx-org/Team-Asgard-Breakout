

import 'dart:async';
import 'dart:ui';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:flame/components.dart';

class ScoreText extends TextComponent with HasGameRef<BreakoutGame> {
 late int score;

 
 ScoreText.playerScore({
  this.score = 0,
 })  : _textPaint = TextPaint(textDirection: TextDirection.rtl),
      super( anchor: Anchor.center,);
 
 late final TextPaint _textPaint;
 
 @override
 FutureOr<void> onLoad() {
   score = 0;
 final textOffset = (_textPaint.textDirection == TextDirection.ltr ? -1 : 1) * 50;
   position.setValues(gameRef.size.x / 60 + 29, 50);
   text = score.toString();
 
 return super.onLoad();
 }
 
 @override
 void render(Canvas canvas) {
   _textPaint.render(canvas, 'Score: $score', Vector2.zero());
 }
}