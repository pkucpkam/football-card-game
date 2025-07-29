import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dream_card_fc/widgets/player/sell/market_table.dart';
import 'package:dream_card_fc/widgets/player/sell/trend_chart.dart';
import 'package:dream_card_fc/widgets/player/sell/quick_sell_modal.dart';
import 'package:dream_card_fc/widgets/player/sell/custom_sell_modal.dart';

class SellConfirmationDialog extends StatefulWidget {
  final String playerName;
  final double minValue;
  final Function(double, String) onConfirm;

  const SellConfirmationDialog({
    super.key,
    required this.playerName,
    required this.minValue,
    required this.onConfirm,
  });

  @override
  State<SellConfirmationDialog> createState() => _SellConfirmationDialogState();
}

class _SellConfirmationDialogState extends State<SellConfirmationDialog> {
  final TextEditingController _customSellPriceController =
      TextEditingController();
  bool _showTrendChart = false;

  List<Map<String, dynamic>> _mockMarketData() {
    return [
      {'type': 'buy', 'price': widget.minValue * 0.70, 'count': 5},
      {'type': 'sell', 'price': widget.minValue * 0.85, 'count': 3},
      {'type': 'buy', 'price': widget.minValue * 0.90, 'count': 2},
      {'type': 'sell', 'price': widget.minValue * 1.00, 'count': 4},
    ];
  }

  List<FlSpot> _mockPriceData() {
    final base = widget.minValue;
    return [
      FlSpot(0, base * 0.92),
      FlSpot(1, base * 0.88),
      FlSpot(2, base * 0.90),
      FlSpot(3, base * 0.95),
      FlSpot(4, base * 0.93),
      FlSpot(5, base * 0.97),
      FlSpot(6, base),
    ];
  }

  @override
  void dispose() {
    _customSellPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: 320,
        height: 400,
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
              Text(
                'Bán ${widget.playerName}?',
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 6)],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showTrendChart = false;
                      });
                    },
                    child: Text(
                      'Giao dịch',
                      style: TextStyle(
                        color:
                            _showTrendChart
                                ? Colors.white70
                                : Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                        shadows: [
                          Shadow(
                            color:
                                _showTrendChart
                                    ? Colors.transparent
                                    : Colors.cyanAccent.withOpacity(0.5),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showTrendChart = true;
                      });
                    },
                    child: Text(
                      'Xu hướng',
                      style: TextStyle(
                        color:
                            _showTrendChart
                                ? Colors.cyanAccent
                                : Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                        shadows: [
                          Shadow(
                            color:
                                _showTrendChart
                                    ? Colors.cyanAccent.withOpacity(0.5)
                                    : Colors.transparent,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child:
                    _showTrendChart
                        ? TrendChart(priceData: _mockPriceData())
                        : SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Bán nhanh: (70% giá trị)',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontFamily: 'Roboto Condensed',
                                ),
                              ),
                              const SizedBox(height: 12),
                              MarketTable(marketData: _mockMarketData()),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed:
                                        () => showDialog(
                                          context: context,
                                          builder:
                                              (context) => QuickSellModal(
                                                minValue: widget.minValue,
                                                onConfirm: widget.onConfirm,
                                              ),
                                        ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade800,
                                      foregroundColor: Colors.cyanAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shadowColor: Colors.cyanAccent
                                          .withOpacity(0.5),
                                      elevation: 4,
                                    ),
                                    child: const Text(
                                      'Bán nhanh',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Roboto Condensed',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  ElevatedButton(
                                    onPressed:
                                        () => showDialog(
                                          context: context,
                                          builder:
                                              (context) => CustomSellModal(
                                                playerName: widget.playerName,
                                                minValue: widget.minValue,
                                                controller:
                                                    _customSellPriceController,
                                                onConfirm: widget.onConfirm,
                                              ),
                                        ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade800,
                                      foregroundColor: Colors.cyanAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      shadowColor: Colors.cyanAccent
                                          .withOpacity(0.5),
                                      elevation: 4,
                                    ),
                                    child: const Text(
                                      'Đăng bán',
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
              if (_showTrendChart)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showTrendChart = false;
                      });
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
                      'Quay lại',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
