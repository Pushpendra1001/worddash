import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worddash/app.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/services/game_logic_service.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudioService()),
        ChangeNotifierProvider(create: (context) => GameLogicService()),
      ],
      child: const SoundGameApp(),
    ),
  );
}