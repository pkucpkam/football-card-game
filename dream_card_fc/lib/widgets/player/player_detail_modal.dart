import 'package:dream_card_fc/widgets/common/coin_display.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

void showPlayerDetails(
  BuildContext context,
  String name,
  String position,
  Map<String, int> stats,
  double value,
  String imageUrl,
) {
  showDialog(
    context: context,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: GlassContainer(
            width: 320,
            height: MediaQuery.of(context).size.height * 0.5,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey.shade800,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 20,
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
                              'Vị trí: $position',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                            CoinDisplay(balance: value),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Chỉ số:',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Tốc độ', stats['speed']!),
                      _buildStatItem('Sút', stats['shooting']!),
                      _buildStatItem('Chuyền', stats['passing']!),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade800,
                        foregroundColor: Colors.cyanAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shadowColor: Colors.cyanAccent.withOpacity(0.5),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Đóng',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}

Widget _buildStatItem(String label, int value) {
  return Column(
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontFamily: 'Roboto Condensed',
        ),
      ),
      Text(
        '$value',
        style: const TextStyle(
          color: Colors.cyanAccent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Orbitron',
        ),
      ),
    ],
  );
}
