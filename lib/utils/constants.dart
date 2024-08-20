class AppConstants {
  static const String appName = 'Word Dash';
  static const String matchSoundTitle = 'Match the Sound';
  static const String oldSoundsTitle = 'Old Sounds';
  static const String relaxationTitle = 'Relaxation';

  static const int easyDifficultyCount = 4;
  static const int mediumDifficultyCount = 6;
  static const int hardDifficultyCount = 8;

  static const String backgroundMusicPath = 'assets/sounds/background_music.mp3';

  static const int maxLeaderboardEntries = 10;

  static const Map<String, int> difficultyLevels = {
    'Easy': easyDifficultyCount,
    'Medium': mediumDifficultyCount,
    'Hard': hardDifficultyCount,
  };
}