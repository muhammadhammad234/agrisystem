import 'package:flutter/material.dart';

class DatePickerTextFormField extends StatelessWidget {
  String? labelText;
  final String hintText;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final double borderRadius;

  DatePickerTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    this.validator,
    this.controller,
    this.enabled = true,
    this.borderRadius = 50.0,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller?.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true, // Make the field read-only
      onTap: () => _selectDate(context),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      decoration: InputDecoration(
        enabled: enabled,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(.4)),
        suffixIcon: const Icon(Icons.calendar_today),
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      validator: validator ??
          (val) {
            return null;
          },
    );
  }
}
