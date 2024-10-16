import 'package:flutter/material.dart';

class DropdownFieldTemplate extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String?>? validator;

  const DropdownFieldTemplate({
    super.key,
    required this.labelText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
      ),
      value: selectedValue,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
