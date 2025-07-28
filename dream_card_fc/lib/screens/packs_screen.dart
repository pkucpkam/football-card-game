import 'package:dream_card_fc/data/pack_data.dart';
import 'package:dream_card_fc/widgets/pack/pack_item.dart';
import 'package:dream_card_fc/widgets/pack/special_pack_item.dart';
import 'package:flutter/material.dart';

class PacksScreen extends StatelessWidget {
  const PacksScreen({super.key});

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔥 Gói Thẻ Hot',
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotPacks.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final pack = hotPacks[index];
                      return SpecialPackItem(
                            imageUrl: pack['imageUrl']!,
                            title: pack['title']!,
                            subtitle: pack['subtitle']!,
                            price: (pack['price'] as num).toDouble(),
                          )
                          as Widget;
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '🃏 Các Gói Thẻ Khác',
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
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  children:
                      regularPacks
                          .map((pack) {
                            return PackItem(
                              imageUrl: pack['imageUrl']!,
                              title: pack['title']!,
                              subtitle: pack['subtitle']!,
                              price: (pack['price'] as num).toDouble(),
                            );
                          })
                          .toList()
                          .cast<Widget>(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
