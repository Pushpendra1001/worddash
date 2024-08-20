// class Assets {
//   // Sound Files
//   static const String dogBark = 'assets/sounds/dog_bark.mp3';
//   static const String catMeow = 'assets/sounds/cat_meow.mp3';
//   static const String birdChirp = 'assets/sounds/bird_chirp.mp3';
//   static const String horseNeigh = 'assets/sounds/horse_neigh.mp3';
//   static const String cowMoo = 'assets/sounds/cow_moo.mp3';
//   static const String sheepBaa = 'assets/sounds/sheep_baa.mp3';
//   static const String pigOink = 'assets/sounds/pig_oink.mp3';
//   static const String roosterCrow = 'assets/sounds/rooster_crow.mp3';
//   static const String oceanWaves = 'assets/sounds/ocean_waves.mp3';
//   static const String rainfall = 'assets/sounds/rainfall.mp3';
//   static const String forest = 'assets/sounds/forest.mp3';
//   static const String windChimes = 'assets/sounds/wind_chimes.mp3';
//   static const String stream = 'assets/sounds/stream.mp3';
//   static const String campfire = 'assets/sounds/campfire.mp3';
//   static const String rotaryPhone = 'assets/sounds/rotary_phone.mp3';
//   static const String typewriter = 'assets/sounds/typewriter.mp3';
//   static const String vinylRecord = 'assets/sounds/vinyl_record.mp3';
//   static const String tvStatic = 'assets/sounds/tv_static.mp3';
//   static const String cassette = 'assets/sounds/cassette.mp3';
//   static const String dialup = 'assets/sounds/dialup.mp3';

//   // Icon Files
//   static const String dogIcon = 'assets/icons/dog.jpg';
//   static const String catIcon = 'assets/icons/cat.jpg';
//   static const String birdIcon = 'assets/icons/bird.jpg';
//   static const String horseIcon = 'assets/icons/horse.jpg';
//   static const String cowIcon = 'assets/icons/cow.jpg';
//   static const String sheepIcon = 'assets/icons/sheep.jpg';
//   static const String pigIcon = 'assets/icons/pig.jpg';
//   static const String roosterIcon = 'assets/icons/rooster.jpg';
//   static const String waveIcon = 'assets/icons/wave.jpg';
//   static const String rainIcon = 'assets/icons/rain.jpg';
//   static const String treeIcon = 'assets/icons/tree.jpg';
//   static const String chimesIcon = 'assets/icons/chimes.jpg';
//   static const String riverIcon = 'assets/icons/river.jpg';
//   static const String fireIcon = 'assets/icons/fire.jpg';
//   static const String phoneIcon = 'assets/icons/phone.jpg';
//   static const String typewriterIcon = 'assets/icons/typewriter.jpg';
//   static const String vinylIcon = 'assets/icons/vinyl.jpg';
//   static const String tvIcon = 'assets/icons/tv.jpg';
//   static const String cassetteIcon = 'assets/icons/cassette.jpg';
//   static const String computerIcon = 'assets/icons/computer.jpg';
//   static const String playIcon = 'assets/icons/play.png';

//   // Other Images
//   static const String gameLogo = 'assets/images/game_logo.svg';

//   // Fonts
//   static const String robotoRegular = 'assets/fonts/Roboto-Regular.ttf';
//   static const String robotoBold = 'assets/fonts/Roboto-Bold.ttf';

//   // Lists for easy iteration
//   static const List<String> allSounds = [
//     dogBark, catMeow, birdChirp, horseNeigh, cowMoo, sheepBaa, pigOink, roosterCrow,
//     oceanWaves, rainfall, forest, windChimes, stream, campfire,
//     rotaryPhone, typewriter, vinylRecord, tvStatic, cassette, dialup,
//   ];

//   static const List<String> allIcons = [
//     dogIcon, catIcon, birdIcon, horseIcon, cowIcon, sheepIcon, pigIcon, roosterIcon,
//     waveIcon, rainIcon, treeIcon, chimesIcon, riverIcon, fireIcon,
//     phoneIcon, typewriterIcon, vinylIcon, tvIcon, cassetteIcon, computerIcon, playIcon,
//   ];
// }


class Assets {
  // Background Images
  static const String homeBackground = 'assets/images/home_background.png';
  static const String gameBackground = 'assets/images/game_background.png';
  static const String relaxBackground = 'assets/images/relax_background.png';

  // Sound Files
  static const String dogBark = 'assets/sounds/dog_bark.mp3';
  static const String catMeow = 'assets/sounds/cat_meow.mp3';
  static const String birdChirp = 'assets/sounds/bird_chirp.mp3';
  static const String horseNeigh = 'assets/sounds/horse_neigh.mp3';
  static const String cowMoo = 'assets/sounds/cow_moo.mp3';
  static const String sheepBaa = 'assets/sounds/sheep_baa.mp3';
  
  // Relaxing Sounds
  static const String oceanWaves = 'assets/sounds/ocean_waves.mp3';
  static const String rainfall = 'assets/sounds/rainfall.mp3';
  static const String forest = 'assets/sounds/forest.mp3';
  static const String windChimes = 'assets/sounds/wind_chimes.mp3';

  // Icon Files
  static const String dogIcon = 'assets/icons/dog.jpg';
  static const String catIcon = 'assets/icons/cat.jpg';
  static const String birdIcon = 'assets/icons/bird.jpg';
  static const String horseIcon = 'assets/icons/horse.jpg';
  static const String cowIcon = 'assets/icons/cow.jpg';
  static const String sheepIcon = 'assets/icons/sheep.jpg';

  // Relaxation Icons
  static const String waveIcon = 'assets/icons/wave.jpg';
  static const String rainIcon = 'assets/icons/rain.jpg';
  static const String treeIcon = 'assets/icons/tree.jpg';
  static const String chimesIcon = 'assets/icons/chimes.jpg';

  // Other Images
  static const String gameLogo = 'assets/images/game_logo.jpg';
  static const String helpIcon = 'assets/icons/help.jpg';
  static const String settingsIcon = 'assets/icons/settings.jpg';

  // Lists for easy iteration
  static const List<Map<String, String>> gameSounds = [
    {'name': 'Dog', 'sound': dogBark, 'icon': dogIcon},
    {'name': 'Cat', 'sound': catMeow, 'icon': catIcon},
    {'name': 'Bird', 'sound': birdChirp, 'icon': birdIcon},
    {'name': 'Horse', 'sound': horseNeigh, 'icon': horseIcon},
    {'name': 'Cow', 'sound': cowMoo, 'icon': cowIcon},
    {'name': 'Sheep', 'sound': sheepBaa, 'icon': sheepIcon},
  ];

  static const List<Map<String, String>> relaxingSounds = [
    {'name': 'Ocean Waves', 'sound': oceanWaves, 'icon': waveIcon},
    {'name': 'Rainfall', 'sound': rainfall, 'icon': rainIcon},
    {'name': 'Forest', 'sound': forest, 'icon': treeIcon},
    {'name': 'Wind Chimes', 'sound': windChimes, 'icon': chimesIcon},
  ];
}