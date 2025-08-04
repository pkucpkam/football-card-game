import 'package:flutter/material.dart';

class PackOpenScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const PackOpenScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 80),
                ),
              ),
              const SizedBox(height: 20),

              // Tên gói
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  color: Colors.cyanAccent,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white70,
                ),
              ),

              const Spacer(),

              // 2 nút bên dưới
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: xử lý mở tất cả
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đã mở tất cả gói $title')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'MỞ ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron',
                      ),
                    ),
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
