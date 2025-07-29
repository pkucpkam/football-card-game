import 'package:dream_card_fc/widgets/common/coin_display.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                            Row(
                              children: const [
                                Text(
                                  'Balance: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontFamily: 'Roboto Condensed',
                                  ),
                                ),
                                CoinDisplay(balance: 1234.56),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/test');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              81,
                              162,
                              234,
                            ),
                            foregroundColor: Colors.cyanAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: Colors.cyanAccent.withOpacity(0.5),
                            elevation: 4,
                            padding: const EdgeInsets.all(12),
                            minimumSize: const Size(48, 52),
                          ),
                          child: const Icon(
                            Icons.account_circle,
                            size: 24,
                            color: Colors.black,
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
                        _buildStatColumn(
                          Icons.people,
                          'Players',
                          const Text(
                            '100',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _buildStatColumn(
                          Icons.monetization_on,
                          'Total Value',
                          const CoinDisplay(balance: 100),
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
                      assetIconPath: 'assets/icons/calendar.png',
                      label: 'Điểm danh',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/checkin');
                      },
                    ),
                    _buildFeatureButton(
                      assetIconPath: 'assets/icons/pitch.png',
                      label: 'Đội hình',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/pitch');
                      },
                    ),
                    _buildFeatureButton(
                      assetIconPath: 'assets/icons/ranking.png',
                      label: 'Xếp hạng',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ranking');
                      },
                    ),
                    _buildFeatureButton(
                      assetIconPath: 'assets/icons/missions.png',
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
    );
  }

  Widget _buildStatColumn(IconData icon, String label, Widget valueWidget) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 2),
        valueWidget,
      ],
    );
  }

  Widget _buildFeatureButton({
    required String assetIconPath,
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
            Image.asset(
              assetIconPath,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
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
            onTap: () {},
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
