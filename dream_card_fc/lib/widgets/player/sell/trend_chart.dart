import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrendChart extends StatelessWidget {
  final List<FlSpot> priceData;

  const TrendChart({super.key, required this.priceData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.transparent,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      const days = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
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
                  spots: priceData,
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
                  priceData
                      .map((spot) => spot.y)
                      .reduce((a, b) => a < b ? a : b) *
                  0.9,
              maxY:
                  priceData
                      .map((spot) => spot.y)
                      .reduce((a, b) => a > b ? a : b) *
                  1.1,
            ),
          ),
        ),
      ],
    );
  }
}
