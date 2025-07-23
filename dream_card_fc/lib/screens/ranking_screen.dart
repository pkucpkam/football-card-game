import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 12),
                Text(
                  'Top người chơi với đội hình giá trị nhất!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                const SizedBox(height: 24),
                _buildLeaderboardList(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 4),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.cyanAccent,
      unselectedItemColor: Colors.grey.shade600,
      backgroundColor: Colors.black.withOpacity(0.9),
      elevation: 10,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/market');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/packs');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/players');
            break;
          case 4:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Market'),
        BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Packs'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'Players',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
        ),
      ],
    );
  }

  Widget _buildLeaderboardList(BuildContext context) {
    return Column(
      children:
          leaderboardPlayers.asMap().entries.map((entry) {
            final index = entry.key;
            final player = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildPlayerItem(
                context,
                rank: index + 1,
                imageUrl: player['imageUrl']!,
                name: player['name']!,
                teamValue: player['teamValue']!,
              ),
            );
          }).toList(),
    );
  }

  Widget _buildPlayerItem(
    BuildContext context, {
    required int rank,
    required String imageUrl,
    required String name,
    required int teamValue,
  }) {
    return GlassContainer(
      height: 80,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [
          Colors.deepPurple.withOpacity(0.3),
          Colors.black.withOpacity(0.3),
        ],
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.cyanAccent.withOpacity(0.8),
          Colors.pinkAccent.withOpacity(0.8),
        ],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.cyanAccent.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 60,
                    height: 80,
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.cyanAccent,
                      size: 40,
                    ),
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#$rank $name',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
                      shadows: [
                        Shadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        '$teamValue triệu €',
                        textStyle: TextStyle(
                          color: Colors.yellow.shade300,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Orbitron',
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const List<Map<String, dynamic>> leaderboardPlayers = [
    {
      'imageUrl': 'https://example.com/avatar1.jpg',
      'name': 'ProGamerX',
      'teamValue': 500,
    },
    {
      'imageUrl': 'https://example.com/avatar2.jpg',
      'name': 'SoccerKing',
      'teamValue': 450,
    },
    {
      'imageUrl': 'https://example.com/avatar3.jpg',
      'name': 'Homie',
      'teamValue': 400,
    },
    {
      'imageUrl': 'https://example.com/avatar4.jpg',
      'name': 'LegendPlayer',
      'teamValue': 350,
    },
    {
      'imageUrl': 'https://example.com/avatar5.jpg',
      'name': 'StarStriker',
      'teamValue': 300,
    },
  ];
}
