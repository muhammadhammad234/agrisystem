import 'package:flutter/material.dart';

class RadioButtonTemplate extends StatelessWidget {
  RadioButtonTemplate(
      {super.key,
      required this.groupValue,
      required this.value,
      required this.options,required this.text
      });
  List<String> options;
  bool groupValue;
  bool value;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(text),
      Row(
          children: List.generate(options.length, (index) {
        return Expanded(
          child: RadioListTile<bool>(
            title: const Text('Oui'),
            value: value,
            groupValue: groupValue,
            onChanged: (val) {
              value = val!;
            },
          ),
        );
      }))
    ]);
  }
}
