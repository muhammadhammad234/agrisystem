import 'package:flutter/material.dart';

class DropdownButtonFormFieldTemplate extends StatelessWidget {
  DropdownButtonFormFieldTemplate({
    super.key,
    required this.value,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.borderRadius = 50.0,
    this.keyboardType = TextInputType.text,
    this.validator,
    // this.onSubmitted,
  });

  String value;
  List<String> items;
  String hintText;
  void Function(String?)? onChanged;
  double borderRadius;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  // void Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFFF5FCF9),

      // dropdownColor: Theme.of(context).colorScheme.secondary,
      value: value,
      items: List.generate(
          items.length,
          (index) =>
              DropdownMenuItem(value: items[index], child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(items[index]),
              ))),
      // ) [
      //   DropdownMenuItem(value: 'Masculin', child: Text('Masculin')),
      //   DropdownMenuItem(value: 'Féminin', child: Text('Féminin')),
      // ],
      onChanged: onChanged ?? (value) {},
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),

      decoration: InputDecoration(

        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.secondary.withOpacity(.5)),
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
          (value) {
            return null;
          },
    );
  }
}
