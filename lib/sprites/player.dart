import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_test/constants.dart';
import 'package:flame_test/game/go_green_game.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

class Player extends SpriteComponent with HasGameReference<GoGreenGame> {
  @override
  FutureOr<void> onLoad() async {
    /* sprite_apple = await Sprite.load("apple.png");
    sprite_banana = await Sprite.load("banana.png");
    sprite_strawberry = await Sprite.load("strawberry.png"); */

    sprite = await Sprite.load("apple.png");

    size = Vector2.all(100);
    position = Vector2(0, -(gameHeight / 2) + (size.y / 2));
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    double newY = position.y + (dt * 400);

    if (newY > (game.size.y / 2) - (size.y / 2)) {
      newY = (game.size.y / 2) - (size.y / 2);
    }

    position.y = newY;
  }

  void move(double deltaX) {
    double newX = position.x + deltaX;

    double minX = -(game.size.x / 2) + (size.x / 2); //left boundary
    double maxX = (game.size.x / 2) - (size.x / 2); //right boundary

    newX = newX.clamp(minX, maxX);

    position.x = newX;
  }
}
