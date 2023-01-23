import 'package:flutter/material.dart';
import 'package:donut_app_ui/utils/custom_text.dart';

class IncrementDecrementButton extends StatefulWidget {
  final bool isIncrement;
  final VoidCallback onTap;
  const IncrementDecrementButton({
    Key? key,
    required this.isIncrement,
    required this.onTap,
  }) : super(key: key);

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.0, color: Colors.black45),
            color: Colors.white54),
        child: Center(
          child: CustomFont(
            text: widget.isIncrement ? "+" : "—",
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
