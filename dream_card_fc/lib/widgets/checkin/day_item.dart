
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

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 100,
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
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ngày ${widget.day}',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 14,
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
              Image.network(
                'https://example.com/reward${widget.day}.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
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
            Positioned(
              top: 8,
              right: 8,
              child: AnimatedOpacity(
                opacity: widget.isChecked ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24,
                ),
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
