import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:worddash/common_styles.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/widgets/custom_app_bar.dart';
import 'package:worddash/widgets/sound_card.dart';

class OldSoundsScreen extends StatelessWidget {
  const OldSoundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioService audioService = Provider.of<AudioService>(context);

    final List<Map<String, String>> oldSounds = [
      {'name': 'Rotary Phone', 'asset': 'assets/sounds/rotary_phone.mp3', 'icon': 'assets/icons/phone.svg'},
      {'name': 'Typewriter', 'asset': 'assets/sounds/typewriter.mp3', 'icon': 'assets/icons/typewriter.svg'},
      {'name': 'Vinyl Record', 'asset': 'assets/sounds/vinyl_record.mp3', 'icon': 'assets/icons/vinyl.svg'},
      {'name': 'Old TV Static', 'asset': 'assets/sounds/tv_static.mp3', 'icon': 'assets/icons/tv.svg'},
      {'name': 'Cassette Tape', 'asset': 'assets/sounds/cassette.mp3', 'icon': 'assets/icons/cassette.svg'},
      {'name': 'Dial-up Internet', 'asset': 'assets/sounds/dialup.mp3', 'icon': 'assets/icons/computer.svg'},
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Old Sounds'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Take a trip down memory lane with these nostalgic sounds',
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
                itemCount: oldSounds.length,
                itemBuilder: (context, index) {
                  return SoundCard(
                    name: oldSounds[index]['name']!,
                    iconPath: oldSounds[index]['icon']!,
                    onTap: () => audioService.playSound(oldSounds[index]['asset']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}