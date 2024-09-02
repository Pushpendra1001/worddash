import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/sound_button.dart';
import '../services/audio_service.dart';
import '../models/sound.dart';
import '../utils/helpers.dart';

class MatchSoundScreen extends StatefulWidget {
  const MatchSoundScreen({Key? key}) : super(key: key);

  @override
  _MatchSoundScreenState createState() => _MatchSoundScreenState();
}

class _MatchSoundScreenState extends State<MatchSoundScreen> {
  final AudioService _audioService = AudioService();
  late List<Sound> _gameSounds;
  Sound? _currentSound;
  int _score = 0;
  int _roundsPlayed = 0;
  final int _totalRounds = 10;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    final allSounds = [
      Sound(name: 'Dog', soundPath: 'sounds/dog_bark.mp3', iconPath: 'assets/icons/dog.jpg'),
      Sound(name: 'Cat', soundPath: 'sounds/cat_meow.mp3', iconPath: 'assets/icons/cat.jpg'),
      Sound(name: 'Bird', soundPath: 'sounds/bird_chirp.mp3', iconPath: 'assets/icons/bird.jpg'),
      Sound(name: 'Horse', soundPath: 'sounds/horse_neigh.mp3', iconPath: 'assets/icons/horse.jpg'),
      Sound(name: 'Rotary Phone', soundPath: 'sounds/rotary_phone.mp3', iconPath: 'assets/icons/phone.jpg'),
      Sound(name: 'Cow', soundPath: 'sounds/cow_moo.mp3', iconPath: 'assets/icons/cow.jpg'),
      Sound(name: 'Sheep', soundPath: 'sounds/sheep_baa.mp3', iconPath: 'assets/icons/sheep.jpg'),
      Sound(name: 'Dial-up Internet', soundPath: 'sounds/dialup.mp3', iconPath: 'assets/icons/computer.jpg'),
      Sound(name: 'Cassette', soundPath: 'sounds/cassette.mp3', iconPath: 'assets/icons/cassette.jpg'),
    Sound(name: 'Wind Chimes', soundPath: 'sounds/wind_chimes.mp3', iconPath: 'assets/icons/chimes.jpg'),
    Sound(name: 'Rainfall', soundPath: 'sounds/rainfall.mp3', iconPath: 'assets/icons/rain.jpg'),
      Sound(name: 'Typewriter', soundPath: 'sounds/typewriter.mp3', iconPath: 'assets/icons/typewriter.jpg'),
            Sound(name: 'Rooster', soundPath: 'sounds/rooster_crow.mp3', iconPath: 'assets/icons/rooster.jpg'),
    ];

    _gameSounds = Helpers.pickRandomItems<Sound>(allSounds, 4).cast<Sound>();
    _currentSound = _gameSounds[0]; // Select the first sound as current
    _shuffleGameSounds();
  }

  void _shuffleGameSounds() {
    setState(() {
      _gameSounds = Helpers.shuffleList(_gameSounds);
    });
  }

   @override
  void dispose() {
    // Stop the audio service when the widget is disposed
    _audioService.stopSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(title: 'Match the Sound'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/R.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Text("Match the Sound", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Score: $_score', style: const TextStyle(fontSize: 24, color: Colors.white)),
                    Text('Round: $_roundsPlayed/$_totalRounds', style: const TextStyle(fontSize: 24, color: Colors.white)),
                  ],
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
                  itemCount: _gameSounds.length,
                  itemBuilder: (context, index) {
                    return SoundButton(
                      iconPath: _gameSounds[index].iconPath,
                      label: _gameSounds[index].name,
                      onPressed: () => _onSoundButtonPressed(_gameSounds[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _playCurrentSound,
                  child: const Text('Play Sound'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSoundButtonPressed(Sound sound) {
    if (sound == _currentSound) {
      _audioService.stopSound();
      setState(() {
        _score++;
        _roundsPlayed++;
      });
      _showFeedback(true);
    } else {
      setState(() {
        _roundsPlayed++;
      });
      _showFeedback(false);
    }

    if (_roundsPlayed >= _totalRounds) {
      _endGame();
    } else {
      _nextRound();
    }
  }
 


  void _playCurrentSound() {
    if (_currentSound != null) {
      _audioService.playSound(_currentSound!.soundPath);
    }
  }

  void _showFeedback(bool correct) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(correct ? 'Correct!' : 'Wrong, try again!'),
        backgroundColor: correct ? Colors.green : Colors.red,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _nextRound() {
    setState(() {
      _currentSound = Helpers.pickRandomItems(_gameSounds, 1)[0];
      _shuffleGameSounds();
    });
  }

  void _endGame() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your final score is $_score out of $_totalRounds.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _score = 0;
                  _roundsPlayed = 0;
                  _initializeGame();
                });
              },
            ),
            TextButton(
              child: const Text('Main Menu'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}