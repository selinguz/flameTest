import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_test/game/go_green_game.dart';
import 'package:flame_test/sprites/player.dart';

class Basket extends SpriteComponent
    with HasGameReference<GoGreenGame>, CollisionCallbacks {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("basket.png");

    size = Vector2.all(400);
    position = Vector2(0, (game.size.y / 2) - (size.y / 2));
    anchor = Anchor.center;
    add(RectangleHitbox()); //çarpılabilir, kırılabilir efektini veren ifade
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player && other.position.y > position.y) {
      other.removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
