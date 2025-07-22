import 'dart:math' as math;
import 'package:dream_card_fc/widgets/stat_item.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  final String name;
  final String position;
  final String backgroundImage;
  final String playerImage;
  final int jerseyNumber;
  final String cardLevel;

  const PlayerCard({
    super.key,
    required this.name,
    required this.position,
    required this.backgroundImage,
    required this.playerImage,
    this.jerseyNumber = 0,
    this.cardLevel = "+2",
  });

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 3500,
      ), // Total duration: 3s shrink + 0.5s boom
      vsync: this,
    );

    // Scale animation: shrink to 0.8 over 3s, then "boom" back to 1.2 and settle at 1.0
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 85.7, // ~3s for shrinking (3000ms / 3500ms)
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.8,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 7.15, // ~0.25s for "boom" up
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 7.15, // ~0.25s to settle
      ),
    ]).animate(_controller);

    // Shake animation: no shake for first 3s, then strong shake at "boom"
    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(0.0),
        weight: 85.7, // No shake during shrink
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 12.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 7.15, // Strong shake during "boom"
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 12.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 7.15, // Settle shake
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() async {
    await _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              _shakeAnimation.value *
                  math.sin(DateTime.now().millisecondsSinceEpoch * 0.1),
              0,
            ),
            child: Transform.scale(scale: _scaleAnimation.value, child: child),
          );
        },
        child: Container(
          width: 240,
          height: 400,
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.backgroundImage, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  widget.playerImage,
                  width: 252,
                  height: 360,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 80,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "97",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 253, 252, 156),
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "ST",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 253, 252, 156),
                        height: 0.5,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black87,
                          ),
                        ],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 48,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 40,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(
                      child: Text(
                        widget.cardLevel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 3,
                            color: Color.fromARGB(221, 221, 215, 215),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        StatItem(label: "PAC", value: "86"),
                        StatItem(label: "SHO", value: "90"),
                        StatItem(label: "PAS", value: "99"),
                        StatItem(label: "DRI", value: "41"),
                        StatItem(label: "DEF", value: "66"),
                        StatItem(label: "PHY", value: "77"),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: _playAnimation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text("Boost Card"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
