import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PacksScreen extends StatelessWidget {
  const PacksScreen({super.key});

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
                  '🔥 Các Gói Thẻ Hấp Dẫn',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Khám phá các gói thẻ để sở hữu những cầu thủ yêu thích!',
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75, 
                  children: [
                    _buildPackCard(
                      context,
                      imageUrl:
                          'https://pbs.twimg.com/media/Gu3TcogXsAEFHcO.jpg:large',
                      title: 'Gói Thẻ Man Utd',
                      subtitle: 'Cơ hội sở hữu các cầu thủ Man Utd!',
                      price: '1000 xu',
                    ),
                    _buildPackCard(
                      context,
                      imageUrl:
                          'https://pbs.twimg.com/media/Gu3TcogXsAEFHcO.jpg:large',
                      title: 'Gói Siêu Sao Trẻ',
                      subtitle: 'Mở ra K. Mbappé, Bellingham,...',
                      price: '1500 xu',
                    ),
                    _buildPackCard(
                      context,
                      imageUrl:
                          'https://pbs.twimg.com/media/Gu3TcogXsAEFHcO.jpg:large',
                      title: 'Gói Huyền Thoại',
                      subtitle: 'Sở hữu Messi, Ronaldo,...',
                      price: '2000 xu',
                    ),
                    _buildPackCard(
                      context,
                      imageUrl:
                          'https://pbs.twimg.com/media/Gu3TcogXsAEFHcO.jpg:large',
                      title: 'Gói El Clásico',
                      subtitle: 'Cầu thủ từ Barcelona & Real Madrid',
                      price: '1200 xu',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, 
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 8,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 0) {
            Navigator.pushReplacementNamed(context, '/market');
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

  Widget _buildPackCard(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return GlassContainer(
      height: 240,
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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Ink.image(
              image: NetworkImage(imageUrl),
              height: 240,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  // TODO: Xử lý khi nhấn vào gói thẻ
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Đã chọn $title')));
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
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.yellow.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Xử lý hành động mở gói
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Mở $title')));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Mở gói',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
