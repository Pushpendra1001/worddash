import 'package:flutter/material.dart';
import 'package:worddash/models/sound.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/widgets/custom_app_bar.dart';


class OldSoundsScreen extends StatefulWidget {
  const OldSoundsScreen({Key? key}) : super(key: key);

  @override
  _OldSoundsScreenState createState() => _OldSoundsScreenState();
}

class _OldSoundsScreenState extends State<OldSoundsScreen> {
  final AudioService _audioService = AudioService();
  final List<Sound> oldSounds = [
    Sound(name: 'Rotary Phone', soundPath: 'sounds/rotary_phone.mp3', iconPath: 'assets/icons/phone.jpg'),
      Sound(name: 'Typewriter', soundPath: 'sounds/typewriter.mp3', iconPath: 'assets/icons/typewriter.jpg'),
       Sound(name: 'Ocean Waves', soundPath: 'sounds/ocean_waves.mp3', iconPath: 'assets/icons/wave.jpg'),
    Sound(name: 'Rainfall', soundPath: 'sounds/rainfall.mp3', iconPath: 'assets/icons/rain.jpg'),
      Sound(name: 'Vinyl Record', soundPath: 'sounds/vinyl_record.mp3', iconPath: 'assets/icons/vinyl.jpg'),
      Sound(name: 'TV Static', soundPath: 'sounds/tv_static.mp3', iconPath: 'assets/icons/tv.jpg'),
    Sound(name: 'Wind Chimes', soundPath: 'sounds/wind_chimes.mp3', iconPath: 'assets/icons/chimes.jpg'),
      Sound(name: 'Cassette', soundPath: 'sounds/cassette.mp3', iconPath: 'assets/icons/cassette.jpg'),
      Sound(name: 'Dial-up Internet', soundPath: 'sounds/dialup.mp3', iconPath: 'assets/icons/computer.jpg'),
  ];

  @override
  void dispose() {
    
    _audioService.stopSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Old Sounds'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: oldSounds.length,
        itemBuilder: (context, index) {
          return SoundButton(
            sound: oldSounds[index],
            onPressed: () {
              _audioService.playSound(oldSounds[index].soundPath);
            },
          );
        },
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  final Sound sound;
  final VoidCallback onPressed;

  const SoundButton({
    Key? key,
    required this.sound,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundImage: AssetImage(sound.iconPath),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sound.name),
          ],
        ),
      ),
    );
  }
}