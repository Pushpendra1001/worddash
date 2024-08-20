import 'package:flutter/material.dart';
import '../models/sound.dart';
import 'sound_button.dart';

class GameBoard extends StatelessWidget {
  final List<Sound> sounds;
  final Function(Sound) onSoundPressed;

  const GameBoard({Key? key, required this.sounds, required this.onSoundPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: sounds.length,
      itemBuilder: (context, index) {
        return SoundButton(
          iconPath: sounds[index].iconPath,
          label: sounds[index].name,
          onPressed: () => onSoundPressed(sounds[index]),
        );
      },
    );
  }
}