// 📁 lib/screens/checkin_screen.dart

import 'package:flutter/material.dart';
import '../widgets/checkin/day_item.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen>
    with SingleTickerProviderStateMixin {
  final List<bool> checkInStatus = List.generate(30, (index) => index < 10);
  final int currentDay = 10;

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
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '📅 Điểm Danh Hàng Ngày',
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
                  'Nhận phần thưởng mỗi ngày khi điểm danh!',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontFamily: 'Roboto Condensed',
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                  children: List.generate(30, (index) {
                    return DayItem(
                      day: index + 1,
                      isChecked: checkInStatus[index],
                      isCurrentDay: index + 1 == currentDay,
                      onCheckIn: () {
                        setState(() {
                          checkInStatus[index] = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã điểm danh ngày ${index + 1}'),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
