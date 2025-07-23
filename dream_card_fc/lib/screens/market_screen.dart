import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '🛒 Thị Trường Cầu Thủ',
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
                Padding(
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    child: TabBar(
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
                        Tab(text: 'Search'),
                        Tab(text: 'Hot Player'),
                        Tab(text: 'Your Player'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildSearchTab(context),
                      _buildPlayerList(context, hotPlayers),
                      _buildPlayerList(context, yourPlayers),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context, 0),
      ),
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
            Navigator.pushReplacementNamed(context, '/profile');
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
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
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
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm cầu thủ...',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Roboto Condensed',
                ),
                prefixIcon: Icon(Icons.search, color: Colors.cyanAccent),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto Condensed',
              ),
              onChanged: (value) {
                // TODO: Implement search logic
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildPlayerList(context, searchPlayers),
        ],
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
            players.asMap().entries.map((entry) {
              final player = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildPlayerItem(
                  context,
                  imageUrl: player['imageUrl']!,
                  name: player['name']!,
                  position: player['position']!,
                  stats: player['stats']!,
                  value: player['value']!,
                  isYourPlayer: players == yourPlayers,
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildPlayerItem(
    BuildContext context, {
    required String imageUrl,
    required String name,
    required String position,
    required Map<String, int> stats,
    required int value,
    required bool isYourPlayer,
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
                    child: const Icon(Icons.error, color: Colors.red, size: 30),
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
                    name,
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
                  Text(
                    position,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                  Text(
                    '$value triệu €',
                    style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showPlayerDetails(context, name, position, stats, value);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.cyanAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shadowColor: Colors.cyanAccent.withOpacity(0.5),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Chi tiết',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                isYourPlayer
                    ? OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Bán $name')));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red.shade600),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Bán',
                        style: TextStyle(
                          color: Colors.red.shade600,
                          fontSize: 12,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
                    )
                    : ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Mua $name')));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shadowColor: Colors.cyanAccent.withOpacity(0.5),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Mua',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPlayerDetails(
    BuildContext context,
    String name,
    String position,
    Map<String, int> stats,
    int value,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: GlassContainer(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 20,
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
                    const SizedBox(height: 8),
                    Text(
                      'Vị trí: $position',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                    Text(
                      'Giá trị: $value triệu €',
                      style: TextStyle(
                        color: Colors.yellow.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Chỉ số:',
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('Tốc độ', stats['speed']!),
                        _buildStatItem('Sút', stats['shooting']!),
                        _buildStatItem('Chuyền', stats['passing']!),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade800,
                          foregroundColor: Colors.cyanAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shadowColor: Colors.cyanAccent.withOpacity(0.5),
                          elevation: 4,
                        ),
                        child: const Text(
                          'Đóng',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildStatItem(String label, int value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Roboto Condensed',
          ),
        ),
        Text(
          '$value',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Orbitron',
          ),
        ),
      ],
    );
  }

  static const List<Map<String, dynamic>> searchPlayers = [
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Lionel Messi',
      'position': 'Tiền đạo',
      'stats': {'speed': 85, 'shooting': 92, 'passing': 91},
      'value': 100,
    },
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Kylian Mbappé',
      'position': 'Tiền đạo',
      'stats': {'speed': 97, 'shooting': 88, 'passing': 80},
      'value': 150,
    },
  ];

  static const List<Map<String, dynamic>> hotPlayers = [
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Jude Bellingham',
      'position': 'Tiền vệ',
      'stats': {'speed': 82, 'shooting': 84, 'passing': 87},
      'value': 120,
    },
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Erling Haaland',
      'position': 'Tiền đạo',
      'stats': {'speed': 88, 'shooting': 94, 'passing': 75},
      'value': 180,
    },
  ];

  static const List<Map<String, dynamic>> yourPlayers = [
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Bruno Fernandes',
      'position': 'Tiền vệ',
      'stats': {'speed': 80, 'shooting': 85, 'passing': 90},
      'value': 90,
    },
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Marcus Rashford',
      'position': 'Tiền đạo',
      'stats': {'speed': 92, 'shooting': 87, 'passing': 82},
      'value': 80,
    },
  ];
}
