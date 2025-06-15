import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame_test/player.dart';
import 'package:flutter/material.dart';

class GoGreen extends FlameGame {
  GoGreen({super.children});

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    world.add(Player(position: Vector2(0, 0), radius: 50.0));

    world.add(
      Player(position: Vector2(0, 100), radius: 20.0, color: Colors.blue),
    );
  }

  @override
  Color backgroundColor() {
    return Colors.yellow;
  }
}
