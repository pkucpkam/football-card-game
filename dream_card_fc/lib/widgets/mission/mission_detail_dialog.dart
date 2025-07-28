import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

void showMissionDetailDialog({
  required BuildContext context,
  required String title,
  required String description,
  required String reward,
  required String rewardIcon,
  required String progress,
}) {
  showDialog(
    context: context,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: GlassContainer(
            width: MediaQuery.of(context).size.width * 0.8,
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
                  Text(
                    title,
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
                  const SizedBox(height: 12),
                  Text(
                    'Mô tả: $description',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tiến độ: $progress',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset(
                        rewardIcon,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.card_giftcard,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Phần thưởng: $reward',
                        style: TextStyle(
                          color: Colors.yellow.shade300,
                          fontSize: 16,
                          fontFamily: 'Roboto Condensed',
                        ),
                      ),
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
