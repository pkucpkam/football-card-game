import 'package:dream_card_fc/screens/open/pack_open_screen.dart';
import 'package:dream_card_fc/widgets/common/coin_display.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class SpecialPackItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;

  const SpecialPackItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 260,
      width: 300,
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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 260,
              width: 300,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 260,
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.red, size: 40),
                  ),
                );
              },
            ),
          ),
          Container(
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
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CoinDisplay(
                      balance: price,
                      textStyle: TextStyle(
                        color: Colors.yellow.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Orbitron',
                      ),
                    ),

                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => PackOpenScreen(
                                      imageUrl: imageUrl,
                                      title: title,
                                      subtitle: subtitle,
                                    ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade800,
                            foregroundColor: Colors.cyanAccent,
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
                            'Mở gói',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Roboto Condensed',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Xem chi tiết $title')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.cyanAccent.withOpacity(0.8),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            'Chi tiết',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 12,
                              fontFamily: 'Roboto Condensed',
                            ),
                          ),
                        ),
                      ],
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
