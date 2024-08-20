import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'match_sound_screen.dart';
import 'old_sounds_screen.dart';
import 'relaxation_screen.dart';
import 'settings_screen.dart';
import 'leaderboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
      body: Container(
          
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/R.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Relax and Feel", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),

              SizedBox(height: 50,),

              _buildMenuButton(
                context,
                'Match the Sound',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchSoundScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                'Old Sounds',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OldSoundsScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                'Relaxation',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RelaxationScreen()),
                ),
              ),
        
              // const SizedBox(height: 20),
              // _buildMenuButton(
              //   context,
              //   'Settings',
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const SettingsScreen()),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, VoidCallback onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 115, 98, 92),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      ),
    );
  }
}