import '../models/sound.dart';
import '../utils/helpers.dart';

class GameLogicService {
  List generateGameSounds(List<Sound> allSounds, int count) {
    return Helpers.pickRandomItems(allSounds, count);
  }

  Sound selectRandomSound(List<Sound> sounds) {
    return Helpers.pickRandomItems(sounds, 1).first;
  }

  bool checkAnswer(Sound selectedSound, Sound correctSound) {
    return selectedSound == correctSound;
  }

  int calculateScore(int correctAnswers, int totalQuestions) {
    return (correctAnswers / totalQuestions * 100).round();
  }

  String getDifficultyLevel(int score) {
    if (score < 50) return 'Easy';
    if (score < 80) return 'Medium';
    return 'Hard';
  }
}