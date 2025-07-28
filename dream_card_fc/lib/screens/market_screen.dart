import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import '../data/players_data.dart';
import '../widgets/market/player_item.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '🛒 Thị Trường Cầu Thủ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                ),
                _buildTabBar(),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildSearchTab(context),
                      _buildPlayerList(hotPlayers, false),
                      _buildPlayerList(yourPlayers, true),
                      _buildTradeList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassContainer(
        height: 50,
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
        child: const TabBar(
          labelColor: Colors.cyanAccent,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.cyanAccent,
          tabs: [
            Tab(text: 'Search'),
            Tab(text: 'Hot Player'),
            Tab(text: 'Your Player'),
            Tab(text: 'Substitutes'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GlassContainer(
            height: 50,
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
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm cầu thủ...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.cyanAccent),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildPlayerList(searchPlayers, false),
        ],
      ),
    );
  }

  Widget _buildPlayerList(
    List<Map<String, dynamic>> players,
    bool isYourPlayer,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:
            players
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PlayerItem(
                      imageUrl: p['imageUrl'],
                      name: p['name'],
                      position: p['position'],
                      stats: p['stats'],
                      value: (p['value'] as num?)?.toDouble() ?? 0.0,
                      isYourPlayer: isYourPlayer,
                      onDetailTap: () {},
                      onSellTap: () {},
                      overrall: p['overrall'] ?? 'N/A',
                      level: p['level'] ?? 'N/A',
                      isInTeam: p['isInTeam'] ?? false,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildTradeList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children:
            tradingPlayers
                .map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PlayerItem(
                      imageUrl: p['imageUrl'],
                      name: p['name'],
                      position: p['position'],
                      stats: p['stats'],
                      value: (p['value'] as num?)?.toDouble() ?? 0.0,
                      isYourPlayer: false,
                      onDetailTap: () {},
                      onSellTap: () {},
                      overrall: p['overrall'] ?? 'N/A',
                      level: p['level'] ?? 'N/A',
                      isInTeam: false,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
