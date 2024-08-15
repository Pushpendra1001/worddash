import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worddash/common_styles.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/widgets/custom_app_bar.dart';
import 'package:worddash/widgets/sound_card.dart';

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({Key? key}) : super(key: key);

  @override
  _RelaxationScreenState createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> with SingleTickerProviderStateMixin {
  late AudioService _audioService;
  String? _currentSound;
  int _remainingTime = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Map<String, String>> relaxingSounds = [
    {'name': 'Ocean Waves', 'asset': 'assets/sounds/ocean_waves.mp3', 'icon': 'assets/icons/wave.svg'},
    {'name': 'Rainfall', 'asset': 'assets/sounds/rainfall.mp3', 'icon': 'assets/icons/rain.svg'},
    {'name': 'Forest Ambience', 'asset': 'assets/sounds/forest.mp3', 'icon': 'assets/icons/tree.svg'},
    {'name': 'Wind Chimes', 'asset': 'assets/sounds/wind_chimes.mp3', 'icon': 'assets/icons/chimes.svg'},
    {'name': 'Gentle Stream', 'asset': 'assets/sounds/stream.mp3', 'icon': 'assets/icons/river.svg'},
    {'name': 'Campfire', 'asset': 'assets/sounds/campfire.mp3', 'icon': 'assets/icons/fire.svg'},
  ];

  @override
  void initState() {
    super.initState();
    _audioService = Provider.of<AudioService>(context, listen: false);
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioService.stopSound();
    _animationController.dispose();
    super.dispose();
  }

  void _playSound(String asset) {
    setState(() {
      _currentSound = asset;
      _remainingTime = 0;
      _timer?.cancel();
    });
    _audioService.playSound(asset);
  }

  void _stopSound() {
    setState(() {
      _currentSound = null;
      _remainingTime = 0;
      _timer?.cancel();
    });
    _audioService.stopSound();
  }

  void _setTimer(int minutes) {
    setState(() {
      _remainingTime = minutes * 60;
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _stopSound();
            timer.cancel();
          }
        });
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Relaxation Mode'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Choose a soothing sound to relax',
                style: AppTheme.bodyStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: relaxingSounds.length,
                itemBuilder: (context, index) {
                  final sound = relaxingSounds[index];
                  return SoundCard(
                    name: sound['name']!,
                    iconPath: sound['icon']!,
                    onTap: () => _playSound(sound['asset']!),
                    isPlaying: sound['asset'] == _currentSound,
                  );
                },
              ),
            ),
            if (_currentSound != null) ...[
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Now Playing: ${relaxingSounds.firstWhere((s) => s['asset'] == _currentSound)['name']}',
                      style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => _setTimer(5),
                          child: const Text('5 min'),
                        ),
                        ElevatedButton(
                          onPressed: () => _setTimer(10),
                          child: const Text('10 min'),
                        ),
                        ElevatedButton(
                          onPressed: () => _setTimer(15),
                          child: const Text('15 min'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_remainingTime > 0)
                      Column(
                        children: [
                          Text(
                            'Time Remaining:',
                            style: AppTheme.bodyStyle,
                          ),
                          const SizedBox(height: 8),
                          FadeTransition(
                            opacity: _animation,
                            child: Text(
                              _formatTime(_remainingTime),
                              style: AppTheme.headlineStyle.copyWith(fontSize: 36),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _stopSound,
                      icon: const Icon(Icons.stop),
                      label: const Text('Stop Sound'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: _currentSound != null
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: AppTheme.primaryColor.withOpacity(0.1),
              child: SafeArea(
                child: FadeTransition(
                  opacity: _animation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        relaxingSounds.firstWhere((s) => s['asset'] == _currentSound)['icon']!,
                        height: 24,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Relax and enjoy the soothing sounds',
                        style: AppTheme.bodyStyle.copyWith(color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}