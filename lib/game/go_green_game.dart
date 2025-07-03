import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_test/game/go_green_world.dart';
import 'package:flutter/material.dart';

class GoGreenGame extends FlameGame<GoGreenWorld>
    with HorizontalDragDetector, HasCollisionDetection {
  GoGreenGame() : super(world: GoGreenWorld());

  @override
  Color backgroundColor() {
    return Colors.yellow;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
  }

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    return super.onLoad();
  }
}
