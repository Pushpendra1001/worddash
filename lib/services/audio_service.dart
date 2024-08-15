import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentSound;
  bool _isPlaying = false;

  String? get currentSound => _currentSound;
  bool get isPlaying => _isPlaying;

  Future<void> playSound(String soundPath) async {
    try {
      if (_currentSound == soundPath && _isPlaying) {
        await pauseSound();
      } else {
        await _audioPlayer.play(AssetSource(soundPath));
        _currentSound = soundPath;
        _isPlaying = true;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error playing sound: $e');
    }
  }

  Future<void> pauseSound() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> stopSound() async {
    await _audioPlayer.stop();
    _currentSound = null;
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}