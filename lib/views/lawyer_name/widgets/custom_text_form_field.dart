import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.suffixIcon,
    this.suffix,
    this.readonly = false,
    this.controller,
    required this.hintText,
    this.prefix,
    required this.obscureText,
    this.type,
    this.onFieldSubmitted,
    this.onChanged,
    this.validate,
    this.maxLines,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefix;
  final bool obscureText;
  final TextInputType? type;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool readonly;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validate;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        onSaved: onSaved,
        maxLines: maxLines,
        readOnly: readonly,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        validator: validate,
        decoration: InputDecoration(
            hintText: hintText,
            suffix: suffix,
            suffixIcon: suffixIcon,
            prefixIcon: Icon(prefix),
            focusedBorder: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder()));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(16));
  }
}
