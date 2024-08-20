import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/sound_button.dart';
import '../services/audio_service.dart';
import '../models/sound.dart';

class OldSoundsScreen extends StatelessWidget {
  const OldSoundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioService audioService = AudioService();
    final List<Sound> oldSounds = [
      Sound(name: 'Rotary Phone', soundPath: 'sounds/rotary_phone.mp3', iconPath: 'assets/icons/phone.jpg'),
      Sound(name: 'Typewriter', soundPath: 'sounds/typewriter.mp3', iconPath: 'assets/icons/typewriter.jpg'),
       Sound(name: 'Ocean Waves', soundPath: 'sounds/ocean_waves.mp3', iconPath: 'assets/icons/wave.jpg'),
    Sound(name: 'Rainfall', soundPath: 'sounds/rainfall.mp3', iconPath: 'assets/icons/rain.jpg'),
    Sound(name: 'Forest', soundPath: 'sounds/forest.mp3', iconPath: 'assets/icons/tree.jpg'),
      Sound(name: 'Vinyl Record', soundPath: 'sounds/vinyl_record.mp3', iconPath: 'assets/icons/vinyl.jpg'),
      Sound(name: 'TV Static', soundPath: 'sounds/tv_static.mp3', iconPath: 'assets/icons/tv.jpg'),
    Sound(name: 'Wind Chimes', soundPath: 'sounds/wind_chimes.mp3', iconPath: 'assets/icons/chimes.jpg'),
      Sound(name: 'Cassette', soundPath: 'sounds/cassette.mp3', iconPath: 'assets/icons/cassette.jpg'),
      Sound(name: 'Dial-up Internet', soundPath: 'sounds/dialup.mp3', iconPath: 'assets/icons/computer.jpg'),
    ];

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
            iconPath: oldSounds[index].iconPath,
            label: oldSounds[index].name,
            onPressed: () => audioService.playSound(oldSounds[index].soundPath),
          );
        },
      ),
    );
  }
}