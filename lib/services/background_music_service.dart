import 'package:audioplayers/audioplayers.dart';
import '../utils/constants.dart';

class BackgroundMusicService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future<void> playBackgroundMusic() async {
    if (!_isPlaying) {
      await _audioPlayer.play(AssetSource(AppConstants.backgroundMusicPath));
      _audioPlayer.setReleaseMode(ReleaseMode.loop);
      _isPlaying = true;
    }
  }

  Future<void> stopBackgroundMusic() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      _isPlaying = false;
    }
  }

  Future<void> pauseBackgroundMusic() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _isPlaying = false;
    }
  }

  Future<void> resumeBackgroundMusic() async {
    if (!_isPlaying) {
      await _audioPlayer.resume();
      _isPlaying = true;
    }
  }

  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
  }
}