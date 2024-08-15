import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:worddash/common_styles.dart';
import 'package:worddash/services/audio_service.dart';
import 'package:worddash/services/game_logic_service.dart';
import 'package:worddash/widgets/custom_app_bar.dart';
import 'package:worddash/widgets/game_board.dart';

class MatchSoundScreen extends StatefulWidget {
  const MatchSoundScreen({Key? key}) : super(key: key);

  @override
  _MatchSoundScreenState createState() => _MatchSoundScreenState();
}

class _MatchSoundScreenState extends State<MatchSoundScreen> {
  late AudioService _audioService;
  late GameLogicService _gameLogicService;
  int _score = 0;
  int _round = 1;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _audioService = Provider.of<AudioService>(context, listen: false);
    _gameLogicService = Provider.of<GameLogicService>(context, listen: false);
    _startNewRound();
  }

  void _startNewRound() {
    setState(() {
      _gameLogicService.generateNewRound();
      _round++;
    });
  }

  void _onCorrectMatch() {
    setState(() {
      _score += 10;
      if (_round < 10) {
        _startNewRound();
      } else {
        _isGameOver = true;
      }
    });
  }

  void _onIncorrectMatch() {
    // Optionally deduct points or implement lives system
  }

  void _restartGame() {
    setState(() {
      _score = 0;
      _round = 1;
      _isGameOver = false;
      _startNewRound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Match the Sound',
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Score: $_score',
                style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _isGameOver ? _buildGameOverScreen() : _buildGameScreen(),
      ),
    );
  }

  Widget _buildGameScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Round $_round: Match the sound with the correct image',
            style: AppTheme.bodyStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: GameBoard(
            
            onCorrectMatch: _onCorrectMatch,
            onIncorrectMatch: _onIncorrectMatch,
          ),
        ),
      ],
    );
  }

  Widget _buildGameOverScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Game Over!',
            style: AppTheme.headlineStyle,
          ),
          const SizedBox(height: 20),
          Text(
            'Your Score: $_score',
            style: AppTheme.bodyStyle,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _restartGame,
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }
}