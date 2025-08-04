import 'package:dream_card_fc/screens/open/item_open_screen.dart';
import 'package:dream_card_fc/widgets/items/item.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  // Danh sách item đang sở hữu
  final List<Map<String, dynamic>> ownedItems = const [
    {
      'imageUrl': 'assets/sample/pack.png',
      'title': 'Thẻ Tốc Độ',
      'quantity': 5,
    },
    {'imageUrl': 'assets/sample/pack.png', 'title': 'Bóng Vàng', 'quantity': 3},
    {
      'imageUrl': 'assets/sample/pack.png',
      'title': 'Đôi Giày Phép',
      'quantity': 2,
    },
    {
      'imageUrl': 'assets/sample/pack.png',
      'title': 'Bình Hồi Năng Lượng',
      'quantity': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🎒 Vật phẩm đang sở hữu',
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
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    itemCount: ownedItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 items mỗi hàng
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio:
                              0.68, // Điều chỉnh tỷ lệ để vừa kích thước
                        ),
                    itemBuilder: (context, index) {
                      final item = ownedItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ItemOpenScreen(
                                    imageUrl: item['imageUrl'],
                                    title: item['title'],
                                    quantity: item['quantity'],
                                  ),
                            ),
                          );
                        },
                        child: ItemWidget(
                          imageUrl: item['imageUrl'],
                          title: item['title'],
                          quantity: item['quantity'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
