import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class DayItem extends StatefulWidget {
  final int day;
  final bool isChecked;
  final bool isCurrentDay;
  final VoidCallback onCheckIn;

  const DayItem({
    super.key,
    required this.day,
    required this.isChecked,
    required this.isCurrentDay,
    required this.onCheckIn,
  });

  @override
  State<DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {
  double scale = 1.0;

  final List<String> assetIcons = [
    'assets/icons/coin.png',
    'assets/icons/diamond.png',
    'assets/icons/money-bag.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: double.infinity,
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
      boxShadow: [
        BoxShadow(
          color: Colors.cyanAccent.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ngày ${widget.day}',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 12,
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
              Image.asset(
                assetIcons[widget.day % assetIcons.length],
                width: 20,
                height: 20,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey.shade800,
                      child: const Icon(
                        Icons.card_giftcard,
                        color: Colors.cyanAccent,
                        size: 30,
                      ),
                    ),
              ),
            ],
          ),
          if (widget.isChecked)
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.check_circle,
                color: Colors.greenAccent.withOpacity(0.6),
                size: 32,
              ),
            ),

          if (widget.isCurrentDay && !widget.isChecked)
            Positioned(
              bottom: 8,
              child: GestureDetector(
                onTapDown: (_) => setState(() => scale = 0.95),
                onTapUp: (_) => setState(() => scale = 1.0),
                onTapCancel: () => setState(() => scale = 1.0),
                onTap: widget.onCheckIn,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade600, Colors.green.shade800],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Điểm danh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
