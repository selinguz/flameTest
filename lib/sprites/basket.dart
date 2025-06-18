import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_test/game/go_green_game.dart';

class Basket extends SpriteComponent with HasGameReference<GoGreenGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("basket.png");

    size = Vector2.all(400);
    position = Vector2(0, (game.size.y / 2) - (size.y / 2));
    anchor = Anchor.center;
  }
}
