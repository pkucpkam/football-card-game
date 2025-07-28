import 'package:dream_card_fc/test/test_player.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final List<Map<String, dynamic>> players = [
      {
        'playerImage':
            'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
        'playerName': 'Lionel Messi',
        'overall': '97',
        'position': 'Tiền đạo',
        'price': '100 triệu',
        'bgColor': Colors.blue,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Test Screen'), backgroundColor: Colors.black),
      body: Container(
        color: const Color.fromARGB(255, 233, 108, 108),
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PlayerItem(
                imageUrl: players[index]['playerImage'],
                playerName: players[index]['playerName'],
                position: players[index]['position'],
                price: players[index]['price'],
              ),
            );
          },
        ),
      ),
    );
  }
}
