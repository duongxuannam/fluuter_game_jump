import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:try_your_best/game/doodle_dash.dart';

abstract class Platform<T> extends SpriteGroupComponent<T>
    with HasGameRef<DoodleDash>, CollisionCallbacks {
  final hitBox = RectangleHitbox();
  bool isMoving = false;

  double direction = 1;
  final Vector2 _velocity = Vector2.zero();
  double speed = 35;
  Platform({super.position})
      : super(
          size: Vector2.all(100),
          priority: 2,
        );

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    await add(hitBox);
  }
}
