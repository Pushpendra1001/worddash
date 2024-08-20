import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement leaderboard logic
    final List<Map<String, dynamic>> leaderboardData = [
      {'name': 'Player 1', 'score': 95},
      {'name': 'Player 2', 'score': 90},
      {'name': 'Player 3', 'score': 85},
      // Add more leaderboard data
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Leaderboard'),
      body: ListView.builder(
        itemCount: leaderboardData.length,
        itemBuilder: (context, index) {
          final entry = leaderboardData[index];
          return ListTile(
            leading: Text('${index + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            title: Text(entry['name'], style: const TextStyle(fontSize: 18)),
            trailing: Text('${entry['score']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}