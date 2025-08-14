import 'package:flutter/material.dart';
import 'package:budgeting_app/theme/app_theme.dart';

class PurpleAuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const PurpleAuthButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        disabledBackgroundColor: AppTheme.accent.withValues(alpha: 0.5),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0,
      ),
      child: child,
    );
  }
}
