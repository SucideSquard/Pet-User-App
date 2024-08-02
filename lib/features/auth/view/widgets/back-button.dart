import 'package:flutter/material.dart';
import 'package:user_app/core/constants/colors.dart';

class BackButtonWidget extends StatelessWidget {
  final String text;
  final String buttonName;
  final VoidCallback onTap;
  const BackButtonWidget(
      {super.key,
      required this.text,
      required this.buttonName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text,
          style: const TextStyle(color: ThemeColors.darkGrey),
          children: [
            TextSpan(
              text: buttonName,
              style: const TextStyle(
                color: ThemeColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
