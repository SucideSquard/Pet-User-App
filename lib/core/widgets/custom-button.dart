import 'package:flutter/material.dart';
import 'package:user_app/core/constants/colors.dart';
import 'package:user_app/core/constants/sizes.dart';

/// A customizable button widget.
class AuthButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback onTap;
  final Color? bgcolor;
  final Color? txtcolor;
  final double? height;
  final double? padding;

  /// Creates a custom button with the specified [text] and [onTap] callback.
  const AuthButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.bgcolor,
    this.txtcolor,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding ?? 0),
        elevation: 0,
        minimumSize:
            Size(width ?? double.infinity, height ?? Sizes.buttonHeight),
        backgroundColor: bgcolor ?? ThemeColors.primary,
        foregroundColor: ThemeColors.textWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: txtcolor ?? ThemeColors.textWhite,
          fontSize: Sizes.fontSizeMd,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
