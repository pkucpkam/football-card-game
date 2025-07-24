import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'player_detail_modal.dart';

class PlayerItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String position;
  final Map<String, int> stats;
  final int value;
  final bool isYourPlayer;

  const PlayerItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.position,
    required this.stats,
    required this.value,
    required this.isYourPlayer,
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
                    child: const Icon(Icons.error, color: Colors.red),
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
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    '$value triệu €',
                    style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => PlayerDetailModal(
                            name: name,
                            position: position,
                            stats: stats,
                            value: value,
                          ),
                    );
                  },
                  child: const Text('Chi tiết', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 8),
                isYourPlayer
                    ? OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Bán $name')));
                      },
                      child: const Text('Bán', style: TextStyle(fontSize: 12)),
                    )
                    : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Mua $name')));
                      },
                      child: const Text('Mua', style: TextStyle(fontSize: 12)),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
