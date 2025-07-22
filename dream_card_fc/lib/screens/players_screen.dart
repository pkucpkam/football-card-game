import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.white],
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
                  '⚽ Danh Sách Cầu Thủ',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Khám phá bộ sưu tập cầu thủ của bạn!',
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: samplePlayers.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final player = samplePlayers[index];
                    return _buildPlayerCard(
                      context,
                      imageUrl: player['imageUrl']!,
                      name: player['name']!,
                      position: player['position']!,
                      stats: player['stats']!,
                      value: player['value']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(context, 3),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 8,
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

  Widget _buildPlayerCard(
    BuildContext context, {
    required String imageUrl,
    required String name,
    required String position,
    required Map<String, int> stats,
    required int value,
  }) {
    return GlassContainer(
      height: 100,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.8),
          Colors.blueAccent.withOpacity(0.3),
        ],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Ink.image(
              image: NetworkImage(imageUrl),
              width: 80,
              height: 100,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  _showPlayerDetails(context, name, position, stats, value);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.deepPurple.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
                    backgroundColor: Colors.deepPurple.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Chi tiết',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Bán $name')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Bán',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.blueAccent.withOpacity(0.3),
                ],
              ),
              blur: 12,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.deepPurple.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vị trí: $position',
                      style: TextStyle(
                        color: Colors.deepPurple.shade700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Giá trị: $value triệu €',
                      style: TextStyle(
                        color: Colors.deepPurple.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Chỉ số:',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                          backgroundColor: Colors.deepPurple.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Đóng',
                          style: TextStyle(color: Colors.white, fontSize: 14),
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
          style: TextStyle(color: Colors.deepPurple.shade900, fontSize: 14),
        ),
        Text(
          '$value',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  static const List<Map<String, dynamic>> samplePlayers = [
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
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Jude Bellingham',
      'position': 'Tiền vệ',
      'stats': {'speed': 82, 'shooting': 84, 'passing': 87},
      'value': 120,
    },
  ];
}
