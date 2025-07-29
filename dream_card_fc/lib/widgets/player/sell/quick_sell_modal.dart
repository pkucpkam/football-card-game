import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class QuickSellModal extends StatelessWidget {
  final double minValue;
  final Function(double, String) onConfirm;

  const QuickSellModal({
    super.key,
    required this.minValue,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final quickSellPrice = (minValue * 0.7).toStringAsFixed(2);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: 280,
        height: 200,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bán nhanh đồng nghĩa với việc bán cầu thủ ngay lập tức, bạn có xác nhận không?',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 14,
                  fontFamily: 'Roboto Condensed',
                  shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 6)],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                      'Hủy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onConfirm(double.parse(quickSellPrice), 'quick');
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
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
                      'Xác nhận',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
