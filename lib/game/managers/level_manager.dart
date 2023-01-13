import 'package:flame/components.dart';
import 'package:try_your_best/game/doodle_dash.dart';

class Difficulty {
  const Difficulty(
      {required this.minDistance,
      required this.maxDistance,
      required this.jumpSpeed,
      required this.score});
  final double minDistance;
  final double maxDistance;
  final double jumpSpeed;
  final int score;
}

class LevelManager extends Component with HasGameRef<DoodleDash> {
  LevelManager({this.selectedLevel = 1, this.level = 1});

  int selectedLevel;
  int level;

  final Map<int, Difficulty> levelConfigs = {
    1: const Difficulty(
        minDistance: 200, maxDistance: 300, jumpSpeed: 600, score: 0),
    2: const Difficulty(
        minDistance: 200, maxDistance: 400, jumpSpeed: 650, score: 20),
    3: const Difficulty(
        minDistance: 200, maxDistance: 500, jumpSpeed: 700, score: 40),
    4: const Difficulty(
        minDistance: 200, maxDistance: 600, jumpSpeed: 750, score: 80),
    5: const Difficulty(
        minDistance: 200, maxDistance: 700, jumpSpeed: 800, score: 100),
  };

  double get minDistance {
    return levelConfigs[level]!.minDistance;
  }

  double get maxDistance {
    return levelConfigs[level]!.maxDistance;
  }

  double get startingJumpSpeed {
    return levelConfigs[selectedLevel]!.jumpSpeed;
  }

  double get jumpSpeed {
    return levelConfigs[level]!.jumpSpeed;
  }

  Difficulty get difficulty {
    return levelConfigs[level]!;
  }

  bool shouldLevelUp(int score) {
    int nextLevel = level + 1;
    if (levelConfigs.containsKey(nextLevel)) {
      return levelConfigs[nextLevel]!.score == score;
    }
    return false;
  }

  List<int> get levels {
    return levelConfigs.keys.toList();
  }

  void increaseLevel() {
    if (level < levelConfigs.keys.length) {
      level++;
    }
  }

  void setLevel(int newLevel) {
    if (levelConfigs.containsKey(newLevel)) {
      level = newLevel;
    }
  }

  void selectLevel(int selectLevel) {
    if (levelConfigs.containsKey(selectLevel)) {
      selectedLevel = selectLevel;
    }
  }

  void reset() {
    level = selectedLevel;
  }
}
