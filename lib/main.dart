import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worddash/models/game_state.dart';
import 'package:worddash/services/background_music_service.dart';
import 'app.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameState()),
        Provider(create: (context) => BackgroundMusicService()),
      ],
      child: const SoundGameApp(),
    ),
  );
}