import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_test/game/go_green_game.dart';
import 'package:flame_test/player.dart';

class GoGreenWorld extends World with HasGameReference<GoGreenGame> {
  late final Player player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    add(player);
  }
}
