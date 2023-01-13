import 'dart:math';

import 'package:flame/components.dart';
import 'package:try_your_best/game/doodle_dash.dart';
import 'package:try_your_best/game/managers/managers.dart';
import 'package:try_your_best/game/sprites/sprites.dart';
import 'package:try_your_best/game/util/util.dart';

final Random _random = Random();

class ObjectManager extends Component with HasGameRef<DoodleDash> {
  ObjectManager(
      {this.minVerticalDistanceNextPlatform = 200,
      this.maxVerticalDistanceNextPlatform = 200});
  double minVerticalDistanceNextPlatform, maxVerticalDistanceNextPlatform;

  final probGen = ProbabilityGenerator();
  final double _tallestPlatformHeight = 50;
  final List<Platform> _platforms = [];

  final Map<String, bool> specialPlatforms = {
    'spring': true, // level 1
    'broken': false, // level 2
    'noogler': false, // level 3
    'rocket': false, // level 4
    'enemy': false, // level 5
  };

  void _cleanupPlatforms() {
    final lowestPlat = _platforms.removeAt(0);
    lowestPlat.removeFromParent();
  }

  void enableSpecialty(String specialty) {
    specialPlatforms[specialty] = true;
  }

  void enableLevelSpecialty(int level) {}

  void resetSpecialties() {
    for (var key in specialPlatforms.keys) {
      specialPlatforms[key] = false;
    }
  }

  void configure(int nextLevel, Difficulty config) {
    minVerticalDistanceNextPlatform = gameRef.levelManager.minDistance;
    maxVerticalDistanceNextPlatform = gameRef.levelManager.maxDistance;

    for (int i = 1; i <= nextLevel; i++) {
      enableLevelSpecialty(i);
    }
  }
}
