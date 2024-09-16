import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worddash/models/game_state.dart';
import 'package:worddash/screens/home_screen.dart';
import 'package:worddash/services/background_music_service.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameState()),
        Provider(create: (context) => BackgroundMusicService()),
      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Dash',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    ),
    ),
  );
}