import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';

class CustomSellModal extends StatefulWidget {
  final String playerName;
  final double minValue;
  final TextEditingController controller;
  final Function(double, String) onConfirm;

  const CustomSellModal({
    super.key,
    required this.playerName,
    required this.minValue,
    required this.controller,
    required this.onConfirm,
  });

  @override
  State<CustomSellModal> createState() => _CustomSellModalState();
}

class _CustomSellModalState extends State<CustomSellModal> {
  String? customSellErrorText;

  @override
  Widget build(BuildContext context) {
    final quickSellPrice = (widget.minValue * 0.7).toStringAsFixed(2);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: 280,
        height: 300,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đăng bán ${widget.playerName}',
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron',
                  shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 6)],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Giá tối thiểu: $quickSellPrice',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontFamily: 'Roboto Condensed',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: widget.controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Nhập giá muốn bán',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Roboto Condensed',
                  ),
                  errorText: customSellErrorText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.cyanAccent.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.cyanAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                ),
                style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontFamily: 'Roboto Condensed',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
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
                      'Hủy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final inputPrice = double.tryParse(
                        widget.controller.text,
                      );
                      if (inputPrice == null ||
                          inputPrice < double.parse(quickSellPrice)) {
                        setState(() {
                          customSellErrorText =
                              'Giá phải lớn hơn hoặc bằng $quickSellPrice';
                        });
                        return;
                      }
                      widget.onConfirm(inputPrice, 'custom');
                      Navigator.pop(context);
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
                      'Xác nhận',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto Condensed',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
