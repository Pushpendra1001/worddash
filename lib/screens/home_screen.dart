import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:worddash/common_styles.dart';
import 'package:worddash/widgets/animated_button.dart';
import 'package:worddash/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sound Game'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'game-logo',
                          child: SvgPicture.asset(
                            'assets/images/game_logo.svg',
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Welcome to Sound Game!',
                          style: AppTheme.headlineStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Explore sounds, test your memory, and relax with our audio experiences.',
                          style: AppTheme.bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        AnimatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/match_sound'),
                          child: const Text('Match Sound Game'),
                        ),
                        const SizedBox(height: 20),
                        AnimatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/old_sounds'),
                          child: const Text('Old Sounds'),
                        ),
                        const SizedBox(height: 20),
                        AnimatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/relaxation'),
                          child: const Text('Relaxation Mode'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => _showTutorial(context),
                child: const Text('How to Play'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTutorial(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('How to Play'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('1. Match Sound Game: Listen to sounds and match them with the correct images.'),
                SizedBox(height: 10),
                Text('2. Old Sounds: Enjoy a nostalgic journey through classic sounds from the past.'),
                SizedBox(height: 10),
                Text('3. Relaxation Mode: Immerse yourself in soothing sounds for relaxation and focus.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Got it!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}