import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';
import '../models/game_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Consumer<GameState>(
        builder: (context, gameState, child) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('Background Music'),
                value: gameState.backgroundMusicEnabled,
                onChanged: (bool value) {
                  gameState.setBackgroundMusicEnabled(value);
                },
              ),
              ListTile(
                title: const Text('Difficulty'),
                trailing: DropdownButton<String>(
                  value: gameState.difficulty,
                  items: ['Easy', 'Medium', 'Hard']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      gameState.setDifficulty(newValue);
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}