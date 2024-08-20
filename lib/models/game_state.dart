import 'package:flutter/foundation.dart';
import 'sound.dart';

class GameState with ChangeNotifier {
  List<Sound> _sounds = [];
  int _score = 0;
  bool _backgroundMusicEnabled = true;
  String _difficulty = 'Medium';

  List<Sound> get sounds => _sounds;
  int get score => _score;
  bool get backgroundMusicEnabled => _backgroundMusicEnabled;
  String get difficulty => _difficulty;

  void addSound(Sound sound) {
    _sounds.add(sound);
    notifyListeners();
  }

  void incrementScore() {
    _score++;
    notifyListeners();
  }

  void setBackgroundMusicEnabled(bool value) {
    _backgroundMusicEnabled = value;
    notifyListeners();
  }

  void setDifficulty(String value) {
    _difficulty = value;
    notifyListeners();
  }
}