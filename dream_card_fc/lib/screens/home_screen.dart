import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 2;
  final String userName = 'Homie';
  final double balance = 500.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/background/home_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                GlassContainer(
                  height: 90,
                  width: double.infinity,
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.withOpacity(0.4),
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
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Orbitron',
                              ),
                            ),
                            Text(
                              'Balance: ${balance.toStringAsFixed(2)} €',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/profile');
                          },
                          icon: const Icon(Icons.account_circle, size: 24),
                          label: const Text('Profile'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade800,
                            foregroundColor: Colors.cyanAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: Colors.cyanAccent.withOpacity(0.5),
                            elevation: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GlassContainer(
                  height: 120,
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
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn(Icons.people, 'Players', '100'),
                        _buildStatColumn(
                          Icons.monetization_on,
                          'Total Value',
                          '100M €',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                  children: [
                    _buildFeatureButton(
                      icon: Icons.check_circle,
                      label: 'Điểm danh',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/checkin');
                      },
                    ),
                    _buildFeatureButton(
                      icon: Icons.group,
                      label: 'Đội hình',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/pitch');
                      },
                    ),
                    _buildFeatureButton(
                      icon: Icons.leaderboard,
                      label: 'Bảng xếp hạng',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ranking');
                      },
                    ),
                    _buildFeatureButton(
                      icon: Icons.task,
                      label: 'Nhiệm vụ',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/missions');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  '🔥 Hot Packs Today',
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
                _buildBannerCard(
                  imageUrl:
                      'https://www.ukschooltrips.co.uk/wp-content/uploads/2023/07/ManUnitedfeatured.jpg',
                  title: 'Man Utd Pack',
                  subtitle: 'Chance to get Man Utd players!',
                ),
                const SizedBox(height: 16),
                _buildBannerCard(
                  imageUrl:
                      'https://e0.365dm.com/22/05/1600x900/skysports-mbappe-psg-real-madrid_5777758.png?20220520124411',
                  title: 'Young Stars Pack',
                  subtitle: 'Unlock K. Mbappé, Bellingham, and more!',
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 10,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/market');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/packs');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/players');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Market'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Packs',
          ),
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
      ),
    );
  }

  Widget _buildStatColumn(IconData icon, String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.cyanAccent, size: 36),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontFamily: 'Roboto Condensed',
          ),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              value,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.cyanAccent,
                fontFamily: 'Orbitron',
              ),
              speed: const Duration(milliseconds: 50),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ],
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTapDown: (_) => setState(() {}),
      onTapUp: (_) => setState(() {}),
      onTap: onTap,
      child: GlassContainer(
        height: 150,
        width: 150,
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
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 40),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
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
          ],
        ),
      ),
    );
  }

  Widget _buildBannerCard({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return GlassContainer(
      height: 180,
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
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.cyanAccent.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.red, size: 40),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              // TODO: Handle banner tap
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 18,
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
                    subtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
