import 'package:flutter/material.dart';
import 'package:dream_card_fc/data/upgrade_data.dart';

class PlayerUpgradeScreen extends StatefulWidget {
  const PlayerUpgradeScreen({super.key});

  @override
  State<PlayerUpgradeScreen> createState() => _PlayerUpgradeScreenState();
}

class _PlayerUpgradeScreenState extends State<PlayerUpgradeScreen> {
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    final player = playerToUpgrade;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Nâng cấp', style: TextStyle(color: Colors.white)),
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  player['cardImage'] as String,
                  height: 120,
                  width: 90,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player['name'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cấp thẻ: ${player['currentLevel']}  →  ${player['nextLevel']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'OVR: ${player['currentOVR']}  →  ${player['nextOVR']}',
                        style: const TextStyle(fontSize: 16),
                      ),

                      Text(
                        'Chỉ số ẩn: ${player['hiddenStats']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Giá trị: ${player['estimatedValue']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tỷ lệ thành công',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: selectedCount * 0.2,
                  backgroundColor: Colors.grey,
                  color: Colors.greenAccent,
                  minHeight: 10,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    return Text(
                      '${index + 1}',
                      style: TextStyle(
                        color:
                            selectedCount > index
                                ? Colors.greenAccent
                                : Colors.white,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(upgradeMaterials.length, (index) {
                final material = upgradeMaterials[index];
                bool isSelected = index < selectedCount;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedCount--;
                      } else if (selectedCount < 5) {
                        selectedCount++;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                isSelected ? Colors.greenAccent : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          material['image'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (isSelected)
                        const Positioned(
                          top: 4,
                          right: 4,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed:
                  selectedCount > 0
                      ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Đang nâng cấp...')),
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.limeAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Nâng cấp',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
