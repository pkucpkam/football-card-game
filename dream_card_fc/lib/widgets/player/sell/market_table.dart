import 'package:flutter/material.dart';

class MarketTable extends StatelessWidget {
  final List<Map<String, dynamic>> marketData;

  const MarketTable({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.cyanAccent.withOpacity(0.5),
        width: 1,
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1.5),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'Số lượng bán',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'Số lượng mua',
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 12,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                'Giá',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        ...marketData.map((data) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  data['type'] == 'sell' ? data['count'].toString() : '-',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    fontFamily: 'Roboto Condensed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  data['type'] == 'buy' ? data['count'].toString() : '-',
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 12,
                    fontFamily: 'Roboto Condensed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  data['price'].toStringAsFixed(2),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: 'Roboto Condensed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
