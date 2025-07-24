import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class PitchScreen extends StatefulWidget {
  const PitchScreen({super.key});

  @override
  State<PitchScreen> createState() => _PitchScreenState();
}

class _PitchScreenState extends State<PitchScreen>
    with SingleTickerProviderStateMixin {
  static const List<Map<String, dynamic>> yourPlayers = [
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Bruno Fernandes',
      'position': 'Tiền vệ',
      'stats': {'speed': 80, 'shooting': 85, 'passing': 90},
      'value': 90,
    },
    {
      'imageUrl':
          'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
      'name': 'Marcus Rashford',
      'position': 'Tiền đạo',
      'stats': {'speed': 92, 'shooting': 87, 'passing': 82},
      'value': 80,
    },
  ];

  final List<Map<String, dynamic>> pitchPositions = List.generate(
    11,
    (index) => {
      'player': null,
      'position': _getPositionName(index),
      'x': _getXPosition(index),
      'y': _getYPosition(index),
    },
  );

  static String _getPositionName(int index) {
    const positions = [
      'GK',
      'LB',
      'CB1',
      'CB2',
      'RB',
      'LM',
      'CM1',
      'CM2',
      'RM',
      'ST1',
      'ST2',
    ];
    return positions[index];
  }

  static double _getXPosition(int index) {
    const xPositions = [0.5, 0.1, 0.3, 0.7, 0.9, 0.1, 0.3, 0.7, 0.9, 0.3, 0.7];
    return xPositions[index];
  }

  static double _getYPosition(int index) {
    const yPositions = [0.9, 0.7, 0.7, 0.7, 0.7, 0.5, 0.5, 0.5, 0.5, 0.3, 0.3];
    return yPositions[index];
  }

  double _scale = 1.0;

  void _selectPlayer(BuildContext context, int positionIndex) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 300),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chọn Cầu Thủ',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Orbitron',
                          shadows: [
                            Shadow(
                              color: Colors.cyanAccent.withOpacity(0.5),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: yourPlayers.length,
                          itemBuilder: (context, index) {
                            final player = yourPlayers[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: GlassContainer(
                                height: 80,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.deepPurple.withOpacity(0.2),
                                    Colors.black.withOpacity(0.2),
                                  ],
                                ),
                                borderGradient: LinearGradient(
                                  colors: [
                                    Colors.cyanAccent.withOpacity(0.6),
                                    Colors.pinkAccent.withOpacity(0.6),
                                  ],
                                ),
                                blur: 8,
                                borderRadius: BorderRadius.circular(12),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                            left: Radius.circular(12),
                                          ),
                                      child: Image.network(
                                        player['imageUrl'],
                                        width: 60,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                                  width: 60,
                                                  height: 80,
                                                  color: Colors.grey.shade800,
                                                  child: const Icon(
                                                    Icons.person,
                                                    color: Colors.cyanAccent,
                                                    size: 40,
                                                  ),
                                                ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              player['name'],
                                              style: TextStyle(
                                                color: Colors.cyanAccent,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Orbitron',
                                              ),
                                            ),
                                            Text(
                                              player['position'],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                fontFamily: 'Roboto Condensed',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pitchPositions[positionIndex]['player'] =
                                                player;
                                          });
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '${player['name']} được chọn cho vị trí ${_getPositionName(positionIndex)}',
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.green.shade600,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          shadowColor: Colors.cyanAccent
                                              .withOpacity(0.5),
                                          elevation: 4,
                                        ),
                                        child: const Text(
                                          'Chọn',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Roboto Condensed',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
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
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '⚽ Sân Bóng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                    fontFamily: 'Orbitron',
                    shadows: [
                      Shadow(
                        color: Colors.cyanAccent.withOpacity(0.5),
                        blurRadius: 8,
                      ),
                    ],
                  ),
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
                      final index = entry.key;
                      final position = entry.value;
                      return Positioned(
                        left:
                            MediaQuery.of(context).size.width * position['x'] -
                            30,
                        top:
                            MediaQuery.of(context).size.height * position['y'] -
                            60,
                        child: GestureDetector(
                          onTapDown: (_) => setState(() => _scale = 0.95),
                          onTapUp: (_) => setState(() => _scale = 1.0),
                          onTapCancel: () => setState(() => _scale = 1.0),
                          onTap: () => _selectPlayer(context, index),
                          child: Transform.scale(
                            scale: _scale,
                            child: GlassContainer(
                              width: 60,
                              height: 60,
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
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyanAccent.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                              child:
                                  position['player'] == null
                                      ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.cyanAccent,
                                            size: 30,
                                          ),
                                          Text(
                                            position['position'],
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontFamily: 'Roboto Condensed',
                                            ),
                                          ),
                                        ],
                                      )
                                      : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.network(
                                              position['player']['imageUrl'],
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => const Icon(
                                                    Icons.person,
                                                    color: Colors.cyanAccent,
                                                    size: 30,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            position['player']['name'],
                                            style: TextStyle(
                                              color: Colors.cyanAccent,
                                              fontSize: 10,
                                              fontFamily: 'Orbitron',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
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
