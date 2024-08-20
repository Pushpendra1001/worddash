import 'package:flutter/material.dart';
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

  final List<Sound> _relaxingSounds = [
    Sound(name: 'Ocean Waves', soundPath: 'sounds/ocean_waves.mp3', iconPath: 'assets/icons/wave.jpg'),
    Sound(name: 'Rainfall', soundPath: 'sounds/rainfall.mp3', iconPath: 'assets/icons/rain.jpg'),
    Sound(name: 'Forest', soundPath: 'sounds/forest.mp3', iconPath: 'assets/icons/tree.jpg'),
    Sound(name: 'Wind Chimes', soundPath: 'sounds/wind_chimes.mp3', iconPath: 'assets/icons/chimes.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Relaxation'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/moon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _currentSound != null
                  ? _buildNowPlayingWidget()
                  : const Center(
                      child: Text(
                        'Select a sound to relax',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
            ),
            _buildSoundList(),
          ],
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
          style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Slider(
          value: _progress,
          onChanged: (value) {
            // TODO: Implement seeking functionality
          },
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
        ),
        const SizedBox(height: 20),
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
      ],
    );
  }

  Widget _buildSoundList() {
    return Container(
      height: 150,
      color: Colors.black.withOpacity(0.7),
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
      // TODO: Implement progress updating logic
    } else {
      _audioService.stopSound();
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
}