import 'package:flutter/material.dart';

class FadeButton extends StatelessWidget {
  const FadeButton({
    super.key,
    required this.left,
    required this.flag,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final double? left;
  final bool flag;
  final Color? color;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: 47,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          opacity: flag ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
