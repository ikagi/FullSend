import 'dart:ui';
import 'package:flutter/cupertino.dart';

class LoginScreenTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const LoginScreenTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: CupertinoTextField(
          controller: controller,
          placeholder: hintText,
          obscureText: obscureText,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 26,
          ),
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 16,
          ),
          placeholderStyle: TextStyle(
            color: CupertinoColors.systemGrey.withOpacity(0.6),
          ),
          cursorColor: CupertinoColors.white,
          clearButtonMode: OverlayVisibilityMode.editing,
          decoration: BoxDecoration(
            color: CupertinoColors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: CupertinoColors.white.withOpacity(0.18),
            ),
          ),
        ),
      ),
    );
  }
}
