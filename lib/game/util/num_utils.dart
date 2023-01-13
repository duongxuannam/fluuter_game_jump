import 'dart:math';

class ProbabilityGenerator {
  final Random _rand = Random();
  ProbabilityGenerator();

  bool generateWithProbability(double percent) {
    var randomInt = _rand.nextInt(100) + 1;
    if (randomInt <= percent) {
      return true;
    }
    return false;
  }
}
