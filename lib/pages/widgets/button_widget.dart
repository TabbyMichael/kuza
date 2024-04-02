import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;
  final TextStyle textStyle;

  const ButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onClicked,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onClicked,
        child: buildContent(),
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 26, color: Colors.white),
          ),
        ],
      );
}
