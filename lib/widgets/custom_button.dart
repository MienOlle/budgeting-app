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
    final TextStyle? buttonText = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w500,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        padding: const EdgeInsets.symmetric(vertical: 16),
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
