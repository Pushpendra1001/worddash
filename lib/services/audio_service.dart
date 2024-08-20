import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  AudioService() {
    _audioPlayer.onDurationChanged.listen((Duration d) {
      _duration = d;
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      _position = p;
    });
  }

  Future<void> playSound(String soundPath) async {
    await _audioPlayer.play(AssetSource(soundPath));
  }

  Future<void> pauseSound() async {
    await _audioPlayer.pause();
  }

  Future<void> stopSound() async {
    await _audioPlayer.stop();
  }

  Future<void> seek(double progress) async {
    final position = _duration * progress;
    await _audioPlayer.seek(position);
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }

  double getCurrentPosition() {
    return _position.inMilliseconds.toDouble();
  }

  double getDuration() {
    return _duration.inMilliseconds.toDouble();
  }
}