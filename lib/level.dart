

import 'dart:async';
import 'dart:ui';

import 'package:game_breakout_task/breakout_game.dart';
import 'package:flame/components.dart';

class LevelText extends TextComponent with HasGameRef<BreakoutGame> {
 late int level;
 
 
 LevelText.playerLevel({
  this.level = 0,
 })  : _textPaint = TextPaint(textDirection: TextDirection.rtl),
      super( anchor: Anchor.center,);
 
 late final TextPaint _textPaint;
 
 @override
 FutureOr<void> onLoad() {
   level = 0;
 final textOffset = (_textPaint.textDirection == TextDirection.ltr ? -1 : 1) * 50;
   position.setValues(gameRef.size.x / 60 + 290, 50);
   text = level.toString();
 
 return super.onLoad();
 }
 
 @override
 void render(Canvas canvas) {
   _textPaint.render(canvas, 'Level: $level', Vector2.zero());
 }
}