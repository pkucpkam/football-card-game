import 'package:flutter/material.dart';
import 'package:dream_card_fc/data/pitch_player_data.dart';
import 'package:dream_card_fc/widgets/pitch/player_card.dart';
import 'package:dream_card_fc/widgets/pitch/player_selector_dialog.dart';

class PitchScreen extends StatefulWidget {
  const PitchScreen({super.key});

  @override
  State<PitchScreen> createState() => _PitchScreenState();
}

class _PitchScreenState extends State<PitchScreen> {
  final List<Map<String, dynamic>> pitchPositions = List.generate(
    11,
    (index) => {
      'player': null,
      'position': getPositionName(index),
      'x': getXPosition(index),
      'y': getYPosition(index),
    },
  );

  double _scale = 1.0;

  void _selectPlayer(BuildContext context, int index) async {
    final selectedPlayer = await showPlayerSelectorDialog(context, index, (
      player,
    ) {
      setState(() {
        pitchPositions[index]['player'] = player;
      });
    });

    if (selectedPlayer != null) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${selectedPlayer['name']} được chọn cho vị trí ${getPositionName(index)}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage('assets/background/pitch_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.cyanAccent,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '⚽ Sân Bóng',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                        fontFamily: 'Orbitron',
                        shadows: [
                          Shadow(color: Colors.cyanAccent, blurRadius: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/pitch_background.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ...pitchPositions.asMap().entries.map((entry) {
                      final i = entry.key;
                      final pos = entry.value;
                      return Positioned(
                        left: MediaQuery.of(context).size.width * pos['x'] - 30,
                        top: MediaQuery.of(context).size.height * pos['y'] - 60,
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _scale = 0.95),
                          onTapUp: (_) => setState(() => _scale = 1.0),
                          onTapCancel: () => setState(() => _scale = 1.0),
                          onTap: () => _selectPlayer(context, i),
                          child: Transform.scale(
                            scale: _scale,
                            child: PitchPlayerCard(
                              positionName: pos['position'],
                              player: pos['player'],
                            ),
                          ),
                        ),
                      );
                    }),
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
