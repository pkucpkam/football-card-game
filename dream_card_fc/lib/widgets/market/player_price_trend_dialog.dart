import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:fl_chart/fl_chart.dart';

class PlayerPriceTrendDialog extends StatelessWidget {
  final String playerName;
  final double currentValue;

  const PlayerPriceTrendDialog({
    super.key,
    required this.playerName,
    required this.currentValue,
  });

  // Mock data cho giá trị cầu thủ trong 7 ngày
  List<FlSpot> _mockPriceData() {
    final base = currentValue;
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
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: 320,
        height: 300,
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
                'Xu hướng giá $playerName',
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 6)],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 160,
                child: LineChart(
                  LineChartData(
                    backgroundColor: Colors.transparent,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const days = [
                              'T2',
                              'T3',
                              'T4',
                              'T5',
                              'T6',
                              'T7',
                              'CN',
                            ];
                            return Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontFamily: 'Roboto Condensed',
                              ),
                            );
                          },
                          interval: 1,
                          reservedSize: 24,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, _) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                                fontFamily: 'Roboto Condensed',
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.cyanAccent.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _mockPriceData(),
                        isCurved: true,
                        color: Colors.cyanAccent,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.cyanAccent.withOpacity(0.2),
                        ),
                      ),
                    ],
                    minX: 0,
                    maxX: 6,
                    minY:
                        _mockPriceData()
                            .map((spot) => spot.y)
                            .reduce((a, b) => a < b ? a : b) *
                        0.9,
                    maxY:
                        _mockPriceData()
                            .map((spot) => spot.y)
                            .reduce((a, b) => a > b ? a : b) *
                        1.1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                  'Đóng',
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
      ),
    );
  }
}
