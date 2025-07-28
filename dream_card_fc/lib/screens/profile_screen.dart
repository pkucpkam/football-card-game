import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  '👤 Hồ Sơ Người Dùng',
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
                  'Quản lý thông tin và đội hình của bạn!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                const SizedBox(height: 24),
                GlassContainer(
                  width: double.infinity,
                  height: 200,
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
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
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
                                (context, error, stackTrace) => Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey.shade800,
                                  child: const Icon(
                                    Icons.account_circle,
                                    size: 80,
                                    color: Colors.cyanAccent,
                                  ),
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
                              const SizedBox(height: 8),
                              Text(
                                'homie@example.com',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontFamily: 'Roboto Condensed',
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
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shadowColor: Colors.cyanAccent.withOpacity(
                                    0.5,
                                  ),
                                  elevation: 4,
                                ),
                                child: const Text(
                                  'Đăng Xuất',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Roboto Condensed',
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
                  '🎁 Nhập Gift Code',
                  style: TextStyle(
                    fontSize: 18,
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
                GlassContainer(
                  width: double.infinity,
                  height: 60,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Nhập mã gift code...',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Roboto Condensed',
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto Condensed',
                            ),
                            onSubmitted: (value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Đã nhập mã: $value')),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Xác nhận mã gift code'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shadowColor: Colors.cyanAccent.withOpacity(0.5),
                            elevation: 4,
                          ),
                          child: const Text(
                            'Xác nhận',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Roboto Condensed',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '📊 Thống Kê Đội Hình',
                  style: TextStyle(
                    fontSize: 18,
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
                GlassContainer(
                  width: double.infinity,
                  height: 120,
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
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.cyanAccent,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Số cầu thủ',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  '15',
                                  textStyle: TextStyle(
                                    color: Colors.cyanAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Orbitron',
                                  ),
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              isRepeatingAnimation: false,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.cyanAccent,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tổng giá trị',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  '250 triệu €',
                                  textStyle: TextStyle(
                                    color: Colors.cyanAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Orbitron',
                                  ),
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              isRepeatingAnimation: false,
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
            Navigator.pushReplacementNamed(context, '/');
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
