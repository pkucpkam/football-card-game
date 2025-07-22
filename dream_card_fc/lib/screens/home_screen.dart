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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xin chào, $userName 👋',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.deepPurple.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              GlassContainer(
                height: 150,
                width: double.infinity,
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(0.2),
                    Colors.white.withOpacity(0.2),
                  ],
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                blur: 10,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn(Icons.people, 'Số cầu thủ', '100'),
                      _buildStatColumn(
                        Icons.monetization_on,
                        'Tổng giá trị',
                        '100 triệu €',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                '🔥 Gói thẻ hot hôm nay',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade900,
                ),
              ),
              const SizedBox(height: 12),

              _buildBannerCard(
                imageUrl:
                    'https://www.ukschooltrips.co.uk/wp-content/uploads/2023/07/ManUnitedfeatured.jpg',
                title: 'Gói Thẻ Man Utd',
                subtitle: 'Cơ hội sở hữu các cầu thủ Man Utd!',
              ),
              const SizedBox(height: 16),

              // Banner 2
              _buildBannerCard(
                imageUrl:
                    'https://e0.365dm.com/22/05/1600x900/skysports-mbappe-psg-real-madrid_5777758.png?20220520124411',
                title: 'Gói Siêu Sao Trẻ',
                subtitle: 'Mở ra K. Mbappé, Bellingham,...',
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 8,
        onTap: (index) {
          if (index == 1) {
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
        Icon(icon, color: Colors.deepPurple.shade700, size: 32),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.deepPurple.shade900)),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              value,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepPurple.shade900,
              ),
              speed: const Duration(milliseconds: 50),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ],
    );
  }

  Widget _buildBannerCard({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return GlassContainer(
      height: 160,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
      ),
      borderGradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.6), Colors.white.withOpacity(0.1)],
      ),
      blur: 8,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Ink.image(
              image: NetworkImage(imageUrl),
              height: 160,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  // TODO: Handle banner tap
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
