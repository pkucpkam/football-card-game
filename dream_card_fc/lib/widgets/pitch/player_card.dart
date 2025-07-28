import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PitchPlayerCard extends StatelessWidget {
  final Map<String, dynamic>? player;
  final String positionName;

  const PitchPlayerCard({
    super.key,
    required this.player,
    required this.positionName,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 60,
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
      child:
          player == null
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, color: Colors.cyanAccent, size: 30),
                  Text(
                    positionName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontFamily: 'Roboto Condensed',
                    ),
                  ),
                ],
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      player!['imageUrl'],
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.person,
                            color: Colors.cyanAccent,
                            size: 30,
                          ),
                    ),
                  ),
                  Text(
                    player!['name'],
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 10,
                      fontFamily: 'Orbitron',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
    );
  }
}
