import 'package:flutter/material.dart';
import 'package:worddash/screens/home_screen.dart';
import 'package:worddash/screens/match_sound_screen.dart';
import 'package:worddash/screens/old_sounds_screen.dart';
import 'package:worddash/screens/relaxation_screen.dart';


class AppRoutes {
  static const String home = '/';
  static const String matchSound = '/match_sound';
  static const String oldSounds = '/old_sounds';
  static const String relaxation = '/relaxation';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomeScreen(),
    matchSound: (context) => const MatchSoundScreen(),
    oldSounds: (context) => const OldSoundsScreen(),
    relaxation: (context) => const RelaxationScreen(),
  };
}