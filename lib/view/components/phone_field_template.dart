import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneFieldTemplate extends StatelessWidget {
  PhoneFieldTemplate(
      {super.key,
      this.focusNode,
      this.hintText,
      this.validator,
      this.borderRadius = 50,
      this.controller,
      this.onChanged,
      this.onSubmitted});

  final String? hintText;
  FocusNode? focusNode;
//  Function(PhoneNumber?)? validator;
  void Function(PhoneNumber)? onChanged;
  void Function(String)? onSubmitted;
  final double borderRadius;
  FutureOr<String?> Function(PhoneNumber?)? validator;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(.4)),
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      keyboardType: TextInputType.phone,
      onChanged: onChanged ?? (value) {},
      onSubmitted: onSubmitted ?? (value) {},
      validator: validator ??
          (val) {
            return null;
          },
      initialCountryCode: 'CD',
      // onChanged: (phone) {
      //   print(phone.completeNumber);
      // },
    );
  }
}
