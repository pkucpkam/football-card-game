import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  '👤 Hồ Sơ Người Dùng',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Quản lý thông tin và đội hình của bạn!',
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),

                GlassContainer(
                  width: double.infinity,
                  height: 200,
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://example.com/avatar.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => const Icon(
                                  Icons.account_circle,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Homie', 
                                style: TextStyle(
                                  color: Colors.deepPurple.shade900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'homie@example.com', 
                                style: TextStyle(
                                  color: Colors.deepPurple.shade700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Đã đăng xuất'),
                                    ),
                                  );
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade600,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: const Text(
                                  'Đăng Xuất',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  '📊 Thống Kê Đội Hình',
                  style: TextStyle(
                    color: Colors.deepPurple.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                GlassContainer(
                  width: double.infinity,
                  height: 120,
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.deepPurple,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Số cầu thủ',
                              style: TextStyle(
                                color: Colors.deepPurple.shade900,
                              ),
                            ),
                            Text(
                              '15',
                              style: TextStyle(
                                color: Colors.deepPurple.shade900,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.deepPurple,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tổng giá trị',
                              style: TextStyle(
                                color: Colors.deepPurple.shade900,
                              ),
                            ),
                            Text(
                              '250 triệu €',
                              style: TextStyle(
                                color: Colors.deepPurple.shade900,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
