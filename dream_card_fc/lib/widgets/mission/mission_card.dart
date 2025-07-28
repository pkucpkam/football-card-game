import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final String reward;
  final String rewardIcon;
  final bool isCompleted;
  final String description;
  final String progress;
  final VoidCallback onClaimReward;
  final VoidCallback onViewDetail;

  const MissionCard({
    super.key,
    required this.title,
    required this.reward,
    required this.rewardIcon,
    required this.isCompleted,
    required this.description,
    required this.progress,
    required this.onClaimReward,
    required this.onViewDetail,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              rewardIcon,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.card_giftcard,
                      color: Colors.cyanAccent,
                      size: 50,
                    ),
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
                    title,
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
                  const SizedBox(height: 4),
                  Text(
                    'Phần thưởng: $reward',
                    style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontSize: 14,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                isCompleted
                    ? ElevatedButton(
                      onPressed: onClaimReward,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Nhận quà',
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                    : OutlinedButton(
                      onPressed: onViewDetail,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.deepPurple.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Chi tiết',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
