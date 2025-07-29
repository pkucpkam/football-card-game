import 'package:dream_card_fc/widgets/common/coin_display.dart';
import 'package:dream_card_fc/widgets/market/buy_player_dialog.dart';
import 'package:dream_card_fc/widgets/market/player_price_trend_dialog.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class MarketPlayerItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String position;
  final Map<String, int> stats;
  final double value;
  final VoidCallback onDetailTap;
  final VoidCallback onSellTap;
  final String overrall;
  final String level;
  final bool isInTeam;

  const MarketPlayerItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.position,
    required this.stats,
    required this.value,
    required this.onDetailTap,
    required this.onSellTap,
    required this.overrall,
    required this.level,
    required this.isInTeam,
    required bool isYourPlayer,
  });

  @override
  State<MarketPlayerItem> createState() => _MarketPlayerItemState();
}

class _MarketPlayerItemState extends State<MarketPlayerItem> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpand,
      child: Column(
        children: [
          GlassContainer(
            height: 80,
            width: double.infinity,
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
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            child: Row(
              children: [
                const SizedBox(width: 12),
                Text(
                  widget.position,
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 16,
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
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey.shade800,
                          child: const Icon(Icons.error, color: Colors.red),
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 16,
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
                        Row(
                          children: [
                            Text(
                              widget.overrall,
                              style: TextStyle(
                                color: Colors.yellow.shade300,
                                fontSize: 16,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.level,
                              style: TextStyle(
                                color: Colors.yellow.shade300,
                                fontSize: 16,
                                fontFamily: 'Roboto Condensed',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CoinDisplay(balance: widget.value),
                const SizedBox(width: 12),
              ],
            ),
          ),

          if (isExpanded)
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: widget.onDetailTap,
                    icon: const Icon(Icons.info_outline),
                    tooltip: 'Chi tiết',
                    color: Colors.cyanAccent,
                  ),

                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PlayerPriceTrendDialog(
                            playerName: widget.name,
                            currentValue: widget.value,
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.stacked_line_chart_outlined),
                    tooltip: 'Xu hướng',
                    color: Colors.cyanAccent,
                  ),

                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đã yêu thích ${widget.name}')),
                      );
                    },
                    icon: const Icon(Icons.star_outline),
                    tooltip: 'Yêu thích',
                    color: Colors.cyanAccent,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BuyPlayerDialog(
                            playerName: widget.name,
                            currentValue: widget.value,
                            onConfirm: (double price) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Đã đặt mua ${widget.name} với giá $price',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart_outlined),
                    tooltip: 'Mua',
                    color: Colors.cyanAccent,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
