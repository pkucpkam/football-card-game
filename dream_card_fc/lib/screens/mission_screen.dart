
import 'package:flutter/material.dart';
import '../data/mission_data.dart';
import '../widgets/mission/mission_card.dart';
import '../widgets/mission/mission_detail_dialog.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed:
                          () =>
                              Navigator.pushReplacementNamed(context, '/'),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '🎯 Nhiệm Vụ Hàng Ngày',
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
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Hoàn thành nhiệm vụ để nhận phần thưởng hấp dẫn!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children:
                      missions.map((mission) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: MissionCard(
                            title: mission['title'],
                            reward: mission['reward'],
                            rewardIcon: mission['rewardIcon'],
                            isCompleted: mission['isCompleted'],
                            description: mission['description'],
                            progress: mission['progress'],
                            onClaimReward: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Nhận thành công: ${mission['reward']}',
                                  ),
                                ),
                              );
                              setState(() {
                                mission['isCompleted'] = false;
                              });
                            },
                            onViewDetail: () {
                              showMissionDetailDialog(
                                context: context,
                                title: mission['title'],
                                description: mission['description'],
                                reward: mission['reward'],
                                rewardIcon: mission['rewardIcon'],
                                progress: mission['progress'],
                              );
                            },
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
