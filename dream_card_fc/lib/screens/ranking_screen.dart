
import 'package:flutter/material.dart';
import '../widgets/leaderboard/user_card.dart';
import '../data/leaderboard_data.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.deepPurple.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed:
                              () =>
                                  Navigator.pushReplacementNamed(context, '/'),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '🏆 Bảng Xếp Hạng',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                            fontFamily: 'Orbitron',
                            shadows: [
                              Shadow(
                                color: Colors.cyanAccent.withOpacity(0.5),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Top người chơi với đội hình giá trị nhất!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                    const SizedBox(height: 24),

                    Column(
                      children:
                          leaderboardPlayers.asMap().entries.map((entry) {
                            final index = entry.key;
                            final player = entry.value;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: UserCard(
                                rank: index + 1,
                                imageUrl: player['imageUrl'],
                                name: player['name'],
                                teamValue: player['teamValue'],
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: UserCard(
              rank: currentUser['rank'],
              imageUrl: currentUser['imageUrl'],
              name: currentUser['name'],
              teamValue: currentUser['teamValue'],
            ),
          ),
        ],
      ),
    );
  }
}
