import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playSound(String soundPath) async {
    await _audioPlayer.play(AssetSource(soundPath));
  }

  Future<void> stopSound() async {
    await _audioPlayer.stop();
  }

  Future<void> pauseSound() async {
    await _audioPlayer.pause();
  }

  Future<void> resumeSound() async {
    await _audioPlayer.resume();
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }
}