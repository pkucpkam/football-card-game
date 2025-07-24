
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class UserCard extends StatelessWidget {
  final int rank;
  final String imageUrl;
  final String name;
  final int teamValue;

  const UserCard({
    super.key,
    required this.rank,
    required this.imageUrl,
    required this.name,
    required this.teamValue,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 80,
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
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 80,
                color: Colors.grey.shade800,
                child: const Icon(
                  Icons.account_circle,
                  color: Colors.cyanAccent,
                  size: 40,
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
                    '#$rank $name',
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
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        '€$teamValue triệu',
                        textStyle: TextStyle(
                          color: Colors.yellow.shade300,
                          fontSize: 14,
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
            ),
          ),
        ],
      ),
    );
  }
} 