import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:user_app/core/constants/colors.dart';
import 'package:user_app/core/constants/sizes.dart';

class ReactiveCustomTextField extends StatelessWidget {
  final String formControlName;
  final String hinttext;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? obsecureText;
  final TextInputType? keyBoardtype;
  final Color? fillcolor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Function(String)? validator;
  final String? value;
  final Map<String, String Function(Object)>? validationMessages;
  const ReactiveCustomTextField({
    super.key,
    required this.formControlName,
    required this.hinttext,
    this.prefixIcon,
    this.suffixIcon,
    this.obsecureText,
    this.keyBoardtype,
    this.fillcolor,
    this.validator,
    this.value,
    this.validationMessages,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      obscureText: obsecureText ?? false,
      keyboardType: keyBoardtype ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(
          color: ThemeColors.darkGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor ?? ThemeColors.dark,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.primary, width: 2),
          borderRadius: BorderRadius.circular(Sizes.buttonRadius),
        ),
        filled: true,
        fillColor: fillcolor ?? ThemeColors.primaryBackground,
      ),
      validationMessages: validationMessages,
    );
  }
}
