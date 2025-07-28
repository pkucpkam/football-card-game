import 'package:flutter/material.dart';

class CoinDisplay extends StatelessWidget {
  final double balance;
  final TextStyle? textStyle;
  final double iconSize;
  final String iconPath;

  const CoinDisplay({
    super.key,
    required this.balance,
    this.textStyle,
    this.iconSize = 18,
    this.iconPath = 'assets/icons/coin.png',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          balance.toStringAsFixed(2),
          style:
              textStyle ??
              const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontFamily: 'Roboto Condensed',
              ),
        ),
        const SizedBox(width: 4),
        Image.asset(iconPath, width: iconSize, height: iconSize),
      ],
    );
  }
}
