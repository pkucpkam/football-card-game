import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:dream_card_fc/data/pitch_player_data.dart';

Future<Map<String, dynamic>?> showPlayerSelectorDialog(
  BuildContext context,
  int positionIndex,
  Function(Map<String, dynamic>) onSelect,
) {
  return showDialog<Map<String, dynamic>>(
    context: context,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: GlassContainer(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Chọn Cầu Thủ',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Orbitron',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: yourPlayers.length,
                      itemBuilder: (context, index) {
                        final player = yourPlayers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(player['imageUrl']),
                          ),
                          title: Text(player['name']),
                          subtitle: Text(player['position']),
                          trailing: ElevatedButton(
                            onPressed: () {
                              onSelect(player);
                              Navigator.pop(context, player);
                            },
                            child: const Text('Chọn'),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
