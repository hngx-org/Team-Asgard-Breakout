import 'package:flame/components.dart';

class WorldX extends SpriteComponent with HasGameRef{
  @override
  Future<void> onLoad() async{
    sprite = await game.loadSprite("game/stars_background.png"
    );
    size = game.size;
    position = Vector2.zero();
    priority = 0;
  }
}