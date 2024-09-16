import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:worddash/common/custombutton.dart';
import 'package:worddash/screens/settings_Screen.dart';
import '../widgets/custom_app_bar.dart';
import 'match_sound_screen.dart';
import 'old_sounds_screen.dart';
import 'relaxation_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/background3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Spacer(),
              
              Text("Relax and Feel", style: GoogleFonts.jockeyOne(fontSize: 62 , color: Colors.white , fontWeight: FontWeight.bold ),),

              SizedBox(height: 50,),

              buildMenuButton(
                context,
                'Match the Sound',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchSoundScreen()),
                ),
              ),
              const SizedBox(height: 20),
              buildMenuButton(
                context,
                'Old Sounds',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OldSoundsScreen()),
                ),
              ),
              const SizedBox(height: 20),
              buildMenuButton(
                context,
                'Relaxation',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RelaxationScreen()),
                ),
              ),
              // const SizedBox(height: 20),
              // buildMenuButton(
              //   context,
              //   'Settings',
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const SettingsScreen()),
              //   ),
              // ),
              const SizedBox(height: 20),
                buildMenuButton(
              context,
              'Quit',
              () => _showExitConfirmationDialog(context),
            ),
        
              // const SizedBox(height: 20),
              // buildMenuButton(
              //   context,
              //   'Settings',
              //   () => Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const SettingsScreen()),
              //   ),
              // ),
              
              
Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}


  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Exit'),
              onPressed: () {
                SystemNavigator.pop(); // Exit the app
              },
            ),
          ],
        );
      },
    );
  }
