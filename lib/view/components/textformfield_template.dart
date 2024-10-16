
import 'package:flutter/material.dart';

class TextFormFieldTemplate extends StatelessWidget {
  String? labelText;
  final String hintText;

  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final int maxLines;
  void Function(String)? onChanged;
  void Function(String?)? onSubmitted;
  double borderRadius;
  Widget? suffixIcon;
  FocusNode? focusNode;
  void Function()? onTap;
  bool enabled;

  TextFormFieldTemplate(
      {super.key,
      this.labelText,
      this.focusNode,
      this.onTap,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.controller,
      this.obscureText = false,
      this.maxLines = 1,
      this.onChanged,
      this.onSubmitted,
      this.suffixIcon,
      this.enabled = true,
      this.borderRadius = 50.0});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // onTap: onTap ?? () {},
      focusNode: focusNode ?? FocusNode(),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      obscureText: obscureText,
      decoration: InputDecoration(
        enabled: enabled,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(.4)),
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged ?? (value) {},
      onFieldSubmitted: onSubmitted ?? (value) {},
      validator: validator ??
          (val) {
            return null;
          },
    );
  }
}