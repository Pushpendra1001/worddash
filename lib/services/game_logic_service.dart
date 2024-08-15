import 'dart:math';
import 'package:flutter/foundation.dart';

class GameLogicService extends ChangeNotifier {
  final List<Map<String, String>> _sounds = [
    {'name': 'Dog', 'asset': 'assets/sounds/dog_bark.mp3', 'icon': 'assets/icons/dog.svg'},
    {'name': 'Cat', 'asset': 'assets/sounds/cat_meow.mp3', 'icon': 'assets/icons/cat.svg'},
    {'name': 'Bird', 'asset': 'assets/sounds/bird_chirp.mp3', 'icon': 'assets/icons/bird.svg'},
    {'name': 'Horse', 'asset': 'assets/sounds/horse_neigh.mp3', 'icon': 'assets/icons/horse.svg'},
    {'name': 'Cow', 'asset': 'assets/sounds/cow_moo.mp3', 'icon': 'assets/icons/cow.svg'},
    {'name': 'Sheep', 'asset': 'assets/sounds/sheep_baa.mp3', 'icon': 'assets/icons/sheep.svg'},
    {'name': 'Pig', 'asset': 'assets/sounds/pig_oink.mp3', 'icon': 'assets/icons/pig.svg'},
    {'name': 'Rooster', 'asset': 'assets/sounds/rooster_crow.mp3', 'icon': 'assets/icons/rooster.svg'},
  ];

  List<Map<String, String>> _currentRound = [];
  String? _currentPlayingSound;
  int _score = 0;
  int _roundNumber = 0;

  List<Map<String, String>> get currentRound => _currentRound;
  String? get currentPlayingSound => _currentPlayingSound;
  int get score => _score;
  int get roundNumber => _roundNumber;

  void generateNewRound() {
    final random = Random();
    _currentRound = List.from(_sounds)..shuffle(random);
    _currentRound = _currentRound.take(6).toList();
    _currentPlayingSound = null;
    _roundNumber++;
    notifyListeners();
  }

  void setCurrentPlayingSound(String soundAsset) {
    _currentPlayingSound = soundAsset;
    notifyListeners();
  }

  bool checkMatch(String selectedSoundName) {
    if (_currentPlayingSound == null) return false;
    
    bool isCorrect = _currentRound.any((sound) => 
      sound['asset'] == _currentPlayingSound && sound['name'] == selectedSoundName);

    if (isCorrect) {
      _score += 10;
    }
    
    notifyListeners();
    return isCorrect;
  }

  void resetGame() {
    _score = 0;
    _roundNumber = 0;
    generateNewRound();
  }
}