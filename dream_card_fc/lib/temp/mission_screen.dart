import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> missions = [
    {
      'title': 'Thắng 3 trận liên tiếp',
      'description': 'Thắng 3 trận liên tiếp trong chế độ thi đấu.',
      'reward': '1000 Xu',
      'rewardImage': 'https://example.com/reward1.jpg',
      'progress': '3/3',
      'isCompleted': true,
    },
    {
      'title': 'Mua 5 cầu thủ',
      'description': 'Mua 5 cầu thủ từ thị trường chuyển nhượng.',
      'reward': '1 Gói Vàng',
      'rewardImage': 'https://example.com/reward2.jpg',
      'progress': '4/5',
      'isCompleted': false,
    },
    {
      'title': 'Điểm danh 7 ngày',
      'description': 'Điểm danh liên tục trong 7 ngày.',
      'reward': '500 Xu',
      'rewardImage': 'https://example.com/reward3.jpg',
      'progress': '5/7',
      'isCompleted': false,
    },
  ];

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
                  '🎯 Nhiệm Vụ Hàng Ngày',
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
                  'Hoàn thành nhiệm vụ để nhận phần thưởng hấp dẫn!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                const SizedBox(height: 24),
                _buildMissionList(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 6),
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
            Navigator.pushReplacementNamed(context, '/leaderboard');
            break;
          case 5:
            Navigator.pushReplacementNamed(context, '/checkin');
            break;
          case 6:
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
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: 'CheckIn',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Missions'),
      ],
    );
  }

  Widget _buildMissionList(BuildContext context) {
    return Column(
      children:
          missions.asMap().entries.map((entry) {
            final mission = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildMissionItem(
                context,
                title: mission['title']!,
                reward: mission['reward']!,
                rewardImage: mission['rewardImage']!,
                isCompleted: mission['isCompleted']!,
                description: mission['description']!,
                progress: mission['progress']!,
              ),
            );
          }).toList(),
    );
  }

  Widget _buildMissionItem(
    BuildContext context, {
    required String title,
    required String reward,
    required String rewardImage,
    required bool isCompleted,
    required String description,
    required String progress,
  }) {
    return GlassContainer(
      height: 100,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              rewardImage,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.card_giftcard,
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
                    title,
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
                  Text(
                    'Phần thưởng: $reward',
                    style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontSize: 14,
                      fontFamily: 'Roboto Condensed',
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
                if (isCompleted)
                  GestureDetector(
                    onTapDown: (_) => setState(() => _rewardScale = 0.95),
                    onTapUp: (_) => setState(() => _rewardScale = 1.0),
                    onTapCancel: () => setState(() => _rewardScale = 1.0),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đã nhận phần thưởng: $reward')),
                      );
                      setState(() {
                        missions[missions.indexWhere(
                              (m) => m['title'] == title,
                            )]['isCompleted'] =
                            false;
                      });
                    },
                    child: Transform.scale(
                      scale: _rewardScale,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade600,
                              Colors.green.shade800,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Text(
                          'Nhận quà',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!isCompleted)
                  GestureDetector(
                    onTapDown: (_) => setState(() => _detailScale = 0.95),
                    onTapUp: (_) => setState(() => _detailScale = 1.0),
                    onTapCancel: () => setState(() => _detailScale = 1.0),
                    onTap: () {
                      _showMissionDetails(
                        context,
                        title,
                        description,
                        reward,
                        rewardImage,
                        progress,
                      );
                    },
                    child: Transform.scale(
                      scale: _detailScale,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade800,
                              Colors.deepPurple.shade600,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Text(
                          'Xem chi tiết',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
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

  double _rewardScale = 1.0;
  double _detailScale = 1.0;

  void _showMissionDetails(
    BuildContext context,
    String title,
    String description,
    String reward,
    String rewardImage,
    String progress,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
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
                        title,
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
                      const SizedBox(height: 12),
                      Text(
                        'Mô tả: $description',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Tiến độ: $progress',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Image.network(
                            rewardImage,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.cyanAccent,
                                  size: 40,
                                ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Phần thưởng: $reward',
                            style: TextStyle(
                              color: Colors.yellow.shade300,
                              fontSize: 16,
                              fontFamily: 'Roboto Condensed',
                            ),
                          ),
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
          ),
    );
  }
}
