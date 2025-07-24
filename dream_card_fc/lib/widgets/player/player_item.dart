// 📁 lib/components/player_item.dart
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PlayerItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String position;
  final Map<String, int> stats;
  final int value;
  final VoidCallback onDetailTap;
  final VoidCallback onSellTap;

  const PlayerItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.position,
    required this.stats,
    required this.value,
    required this.onDetailTap,
    required this.onSellTap,
  });

  @override
  Widget build(BuildContext context) {
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
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 60,
                    height: 80,
                    color: Colors.grey.shade800,
                    child: const Icon(Icons.error, color: Colors.red, size: 30),
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
                    name,
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
                  Text(
                    position,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                  Text(
                    '$value triệu €',
                    style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
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
                ElevatedButton(
                  onPressed: onDetailTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.cyanAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shadowColor: Colors.cyanAccent.withOpacity(0.5),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Chi tiết',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: onSellTap,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red.shade600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    'Bán',
                    style: TextStyle(
                      color: Colors.red.shade600,
                      fontSize: 12,
                      fontFamily: 'Roboto Condensed',
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
}
