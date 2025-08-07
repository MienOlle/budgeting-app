import 'package:flutter/material.dart';
import 'package:budgeting_app/theme/app_theme.dart';

class WhiteInputTextField extends StatelessWidget {
  final String hintText;
  final bool isHidden;
  final Widget? hiddenIcon;
  final TextEditingController controller;

  const WhiteInputTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isHidden = false,
    this.hiddenIcon,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? inputStyle = Theme.of(context).textTheme.displayMedium;
    final TextStyle? hintStyle = inputStyle?.copyWith(
      color: inputStyle.color?.withValues(alpha: 0.75),
    );
    
    return TextField(
      controller: controller,
      obscureText: isHidden,
      style: inputStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.text,
        hintText: hintText,
        hintStyle: hintStyle,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none
        ),
        suffixIcon: hiddenIcon,
      ),
    );
  }
}
