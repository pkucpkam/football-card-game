// 📁 lib/screens/players_screen.dart
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import '../widgets/player/player_item.dart';
import '../data/my_player_data.dart';
import '../widgets/player/player_detail_modal.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '⚽ Danh Sách Cầu Thủ',
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
              ),
              GlassContainer(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.cyanAccent,
                  unselectedLabelColor: Colors.white70,
                  indicatorColor: Colors.cyanAccent,
                  labelStyle: const TextStyle(
                    fontFamily: 'Orbitron',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'Đội hình chính'),
                    Tab(text: 'Cầu thủ dự bị'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPlayerList(context, startingPlayers),
                    _buildPlayerList(context, substitutePlayers),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerList(
    BuildContext context,
    List<Map<String, dynamic>> players,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:
            players.map((player) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PlayerItem(
                  imageUrl: player['imageUrl'],
                  name: player['name'],
                  position: player['position'],
                  stats: player['stats'],
                  value: (player['value'] as num).toDouble(),
                  overrall: player['overall'],
                  level: player['level'],
                  isInTeam: player['isInTeam'],
                  onDetailTap:
                      () => showPlayerDetails(
                        context,
                        player['name'],
                        player['position'],
                        player['stats'],
                        (player['value'] as num).toDouble(),
                        player['imageUrl'],
                      ),
                  onSellTap:
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Bán ${player['name']}')),
                      ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
