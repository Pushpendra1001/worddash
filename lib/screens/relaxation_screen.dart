import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/custom_app_bar.dart';
import '../services/audio_service.dart';
import '../models/sound.dart';

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({Key? key}) : super(key: key);

  @override
  _RelaxationScreenState createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final AudioService _audioService = AudioService();
  Sound? _currentSound;
  bool _isPlaying = false;
  double _progress = 0.0;
  double _volume = 1.0;
  int _timerDuration = 0; // in seconds
  Timer? _timer;

  final List<Sound> _relaxingSounds = [
    Sound(name: 'Perfect N', soundPath: 'sounds/rs1.mp3', iconPath: 'assets/icons/wave.jpg'),
    Sound(name: 'Once In Paris', soundPath: 'sounds/rs2.mp3', iconPath: 'assets/icons/rain.jpg'),
    Sound(name: 'Relaxed', soundPath: 'sounds/rs3.mp3', iconPath: 'assets/icons/tree.jpg'),
    Sound(name: 'Lofi', soundPath: 'sounds/rs4.mp3', iconPath: 'assets/icons/chimes.jpg'),
  ];

  @override
  void dispose() {
    _timer?.cancel();
    _audioService.stopSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Relax and Feel",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _currentSound != null
                    ? _buildNowPlayingWidget()
                    : Center(
                        child: Text(
                          'Select a sound to relax',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 5.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              _buildSoundList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNowPlayingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: AssetImage(_currentSound!.iconPath),
        ),
        const SizedBox(height: 20),
        Text(
          _currentSound!.name,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Slider(
          value: _progress,
          onChanged: (value) {
            setState(() {
              _progress = value;
            });
            _audioService.seek(value);
          },
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _togglePlayPause,
              color: Colors.white,
              iconSize: 48,
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: _stopSound,
              color: Colors.white,
              iconSize: 48,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.volume_down, color: Colors.white),
            Slider(
              value: _volume,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
                _audioService.setVolume(_volume);
              },
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
            Icon(Icons.volume_up, color: Colors.white),
          ],
        ),
        const SizedBox(height: 20),
        _buildTimerWidget(),
      ],
    );
  }

  Widget _buildTimerWidget() {
    return Column(
      children: [
        Text(
          'Timer: ${_formatDuration(_timerDuration)}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _setTimer(15 * 60),
              child: Text('15m'),
              style: ElevatedButton.styleFrom(),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _setTimer(30 * 60),
              child: Text('30m'),
              style: ElevatedButton.styleFrom(),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _setTimer(60 * 60),
              child: Text('1h'),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSoundList() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _relaxingSounds.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _selectSound(_relaxingSounds[index]),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(_relaxingSounds[index].iconPath),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _relaxingSounds[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectSound(Sound sound) {
    setState(() {
      _currentSound = sound;
      _isPlaying = false;
      _progress = 0.0;
    });
    _audioService.stopSound();
  }

  void _togglePlayPause() {
    if (_currentSound == null) return;

    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _audioService.playSound(_currentSound!.soundPath);
      _startProgressTimer();
    } else {
      _audioService.pauseSound();
    }
  }

  void _stopSound() {
    if (_currentSound == null) return;

    setState(() {
      _isPlaying = false;
      _progress = 0.0;
    });
    _audioService.stopSound();
  }

  void _startProgressTimer() {
    const updateInterval = Duration(milliseconds: 500);
    Timer.periodic(updateInterval, (Timer timer) {
      if (!_isPlaying) {
        timer.cancel();
        return;
      }
      setState(() {
        _progress = _audioService.getCurrentPosition() / _audioService.getDuration();
      });
    });
  }

  void _setTimer(int seconds) {
    _timer?.cancel();
    setState(() {
      _timerDuration = seconds;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerDuration > 0) {
          _timerDuration--;
        } else {
          _stopSound();
          timer.cancel();
        }
      });
    });
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}