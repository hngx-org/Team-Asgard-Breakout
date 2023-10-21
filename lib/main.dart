import 'package:game_breakout_task/breakout_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  // final game = BreakoutGame();
  runApp(GameWidget(game: BreakoutGame()));
}
