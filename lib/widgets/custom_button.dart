import 'package:flutter/material.dart';
import 'package:budgeting_app/theme/app_theme.dart';

class PurpleAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PurpleAuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? buttonText = Theme.of(context).textTheme.headlineMedium;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        fixedSize: const Size(270, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: buttonText?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
