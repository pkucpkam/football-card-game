import 'package:dream_card_fc/widgets/player/sell/market_table.dart';
import 'package:dream_card_fc/widgets/player/sell/trend_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:fl_chart/fl_chart.dart';

class BuyPlayerDialog extends StatefulWidget {
  final String playerName;
  final double currentValue;
  final Function(double) onConfirm;

  const BuyPlayerDialog({
    super.key,
    required this.playerName,
    required this.currentValue,
    required this.onConfirm,
  });

  @override
  State<BuyPlayerDialog> createState() => _BuyPlayerDialogState();
}

class _BuyPlayerDialogState extends State<BuyPlayerDialog> {
  final TextEditingController _buyPriceController = TextEditingController();
  String? _errorText;
  bool _showPriceChart = false;

  int get _mockTransactionCount => 42;

  List<Map<String, dynamic>> _mockMarketData() {
    return [
      {'type': 'buy', 'price': widget.currentValue * 0.70, 'count': 5},
      {'type': 'sell', 'price': widget.currentValue * 0.85, 'count': 3},
      {'type': 'buy', 'price': widget.currentValue * 0.90, 'count': 2},
      {'type': 'sell', 'price': widget.currentValue * 1.00, 'count': 4},
    ];
  }

  List<FlSpot> _mockPriceData() {
    final base = widget.currentValue;
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
    _buyPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minBuyPrice = (widget.currentValue * 0.7).toStringAsFixed(2);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: 320,
        height: 420,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPriceChart = false;
                      });
                    },
                    child: Text(
                      'Thông tin',
                      style: TextStyle(
                        color:
                            _showPriceChart
                                ? Colors.white70
                                : Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                        shadows: [
                          Shadow(
                            color:
                                _showPriceChart
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
                        _showPriceChart = true;
                      });
                    },
                    child: Text(
                      'Giá',
                      style: TextStyle(
                        color:
                            _showPriceChart
                                ? Colors.cyanAccent
                                : Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                        shadows: [
                          Shadow(
                            color:
                                _showPriceChart
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
              if (!_showPriceChart)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mua ${widget.playerName}',
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Orbitron',
                            shadows: [
                              Shadow(color: Colors.cyanAccent, blurRadius: 6),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Số lượt giao dịch: $_mockTransactionCount',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Giá tối thiểu: $minBuyPrice',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontFamily: 'Roboto Condensed',
                          ),
                        ),
                        const SizedBox(height: 12),
                        MarketTable(marketData: _mockMarketData()),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _buyPriceController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            labelText: 'Nhập giá muốn mua',
                            labelStyle: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Roboto Condensed',
                            ),
                            errorText: _errorText,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.cyanAccent.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.cyanAccent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.3),
                          ),
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            fontFamily: 'Roboto Condensed',
                          ),
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
                                final inputPrice = double.tryParse(
                                  _buyPriceController.text,
                                );
                                if (inputPrice == null ||
                                    inputPrice < double.parse(minBuyPrice)) {
                                  setState(() {
                                    _errorText =
                                        'Giá phải lớn hơn hoặc bằng $minBuyPrice';
                                  });
                                  return;
                                }
                                widget.onConfirm(inputPrice);
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
                                'Mua',
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
              if (_showPriceChart)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Xu hướng giá ${widget.playerName}',
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Orbitron',
                          shadows: [
                            Shadow(color: Colors.cyanAccent, blurRadius: 6),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TrendChart(priceData: _mockPriceData()),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showPriceChart = false;
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
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
