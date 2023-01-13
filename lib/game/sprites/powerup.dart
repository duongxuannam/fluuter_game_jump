import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:try_your_best/game/doodle_dash.dart';

class PowerUp extends SpriteComponent
    with HasGameRef<DoodleDash>, CollisionCallbacks {
  final hitbox = RectangleHitbox();
  double get jumpSpeedMultiplier;

  PowerUp({
    super.position,
  }) : super(
          size: Vector2.all(50),
          priority: 2,
        );
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    await add(hitbox);
  }
}
