import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:worddash/common_styles.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/services/game_logic_service.dart';
import 'package:worddash/widgets/sound_card.dart';

class GameBoard extends StatelessWidget {
  final Function onCorrectMatch;
  final Function onIncorrectMatch;

  const GameBoard({
    Key? key,
    required this.onCorrectMatch,
    required this.onIncorrectMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioService = Provider.of<AudioService>(context);
    final gameLogicService = Provider.of<GameLogicService>(context);

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: gameLogicService.currentRound.length,
            itemBuilder: (context, index) {
              final sound = gameLogicService.currentRound[index];
              return SoundCard(
                name: 'Play Sound',
                iconPath: 'assets/icons/play.svg',
                onTap: () {
                  audioService.playSound(sound['asset']!);
                  gameLogicService.setCurrentPlayingSound(sound['asset']!);
                },
                isPlaying: sound['asset'] == gameLogicService.currentPlayingSound,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Select the matching animal:',
            style: AppTheme.bodyStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: gameLogicService.currentRound.length,
            itemBuilder: (context, index) {
              final sound = gameLogicService.currentRound[index];
              return GestureDetector(
                onTap: () {
                  if (gameLogicService.checkMatch(sound['name']!)) {
                    onCorrectMatch();
                  } else {
                    onIncorrectMatch();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        sound['icon']!,
                        height: 40,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        sound['name']!,
                        style: AppTheme.cardTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}