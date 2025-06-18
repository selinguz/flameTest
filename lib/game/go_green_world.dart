import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_test/game/go_green_game.dart';
import 'package:flame_test/sprites/basket.dart';
import 'package:flame_test/sprites/player.dart';

class GoGreenWorld extends World with HasGameReference<GoGreenGame> {
  late final Player player;
  late final Basket basket;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    basket = Basket();
    add(player);
    add(basket);
  }
}
