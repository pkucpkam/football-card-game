import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import '../widgets/common/bottom_nav_bar.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.white],
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
                Text(
                  '🔔 Thông Báo',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.deepPurple.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Cập nhật các thông báo mới nhất!',
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sampleNotifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final notification = sampleNotifications[index];
                    return _buildNotificationCard(
                      context,
                      title: notification['title']!,
                      content: notification['content']!,
                      time: notification['time']!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4, onTap: (index) {  },),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String content,
    required String time,
  }) {
    return GlassContainer(
      height: 120,
      width: double.infinity,
      gradient: LinearGradient(
        colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.8),
          Colors.blueAccent.withOpacity(0.3),
        ],
      ),
      blur: 12,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.notifications_active,
              color: Colors.deepPurple.shade700,
              size: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.deepPurple.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.deepPurple.shade700,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Xem chi tiết: $title')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                child: const Text(
                  'Chi tiết',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const List<Map<String, String>> sampleNotifications = [
    {
      'title': 'Gói thẻ mới!',
      'content': 'Gói thẻ Huyền Thoại vừa được thêm vào cửa hàng!',
      'time': '2025-07-22 10:00',
    },
    {
      'title': 'Giao dịch thành công',
      'content': 'Bạn đã mua thành công Kylian Mbappé với giá 150 triệu €.',
      'time': '2025-07-22 09:30',
    },
    {
      'title': 'Cập nhật đội hình',
      'content': 'Đội hình của bạn đã được nâng cấp với cầu thủ mới!',
      'time': '2025-07-21 15:45',
    },
  ];
}