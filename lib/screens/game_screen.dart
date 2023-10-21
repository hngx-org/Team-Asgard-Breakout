import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_breakout_task/breakout_game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late FlameGame game;

  @override
  void initState() {
    super.initState();
    game = BreakoutGame();
    Future.delayed(const Duration(milliseconds: 200), () {});
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: game,
    );
  }
}
