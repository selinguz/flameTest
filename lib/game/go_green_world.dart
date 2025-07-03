import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_test/constants.dart';
import 'package:flame_test/game/go_green_game.dart';
import 'package:flame_test/game/level_data.dart';
import 'package:flame_test/sprites/bin.dart';
import 'package:flame_test/sprites/obstacle.dart';
import 'package:flame_test/sprites/player.dart';

class GoGreenWorld extends World with HasGameReference<GoGreenGame> {
  late final Player player;
  late final Bin bin;

  void loadLevel(List<ObstacleData> levelData) {
    // remove any existing Obstacles
    removeAll(children.whereType<Obstacle>().toList());

    // load new obstacles from level data
    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.trash) {
        obstacle = ObstacleTrash()..position = data.position;
      } else if (data.type == ObstacleType.water) {
        obstacle = ObstacleWater()..position = data.position;
      } else if (data.type == ObstacleType.fire) {
        obstacle = ObstacleFire()..position = data.position;
        // } else if (data.type == ObstacleType.binTrash) {
        //   obstacle = BinTrash()..position = data.position;
        // } else if (data.type == ObstacleType.binRecycle) {
        //   obstacle = BinRecycle()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Player();
    bin = Bin();
    add(player);
    add(bin);

    //add(ObstacleTrash()..position = Vector2(0, 0));
    //add(ObstacleFire()..position = Vector2(-obstacleSize * 2, 0));
    //add(ObstacleWater()..position = Vector2(obstacleSize * 2, 0));

    loadLevel(LevelData().level1());
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.position.y -=
          (dt *
              400); //400 değeri ne kadar büyük olursa nesnenin düşme hızı artar

      if (obstacle.position.y < -(game.size.y / 2)) {
        obstacle.position.y = game.size.y / 2;
      }
    });
  }
}
