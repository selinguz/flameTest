import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_test/constants.dart';
import 'package:flame_test/game/go_green_game.dart';

class Obstacle extends SpriteComponent
    with HasGameReference<GoGreenGame>, CollisionCallbacks {
  final String spritePath;

  Obstacle({required this.spritePath});

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash() : super(spritePath: 'trash.png');
}

class ObstacleWater extends Obstacle {
  ObstacleWater() : super(spritePath: 'water.png');
}

class ObstacleFire extends Obstacle {
  ObstacleFire() : super(spritePath: 'fire.png');
}
