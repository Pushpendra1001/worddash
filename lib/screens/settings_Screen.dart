import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';
import '../models/game_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Consumer<GameState>(
            builder: (context, gameState, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SwitchListTile(
                    title: const Text(
                      'Background Music',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    value: gameState.backgroundMusicEnabled,
                    onChanged: (bool value) {
                      gameState.setBackgroundMusicEnabled(value);
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Difficulty',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                     
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Exit'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}