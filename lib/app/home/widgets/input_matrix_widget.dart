import 'package:flutter/material.dart';

class InputMatrixWidget extends StatelessWidget {
  const InputMatrixWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onTextChanged,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        initialValue: '0',
        keyboardType: TextInputType.number,
        onChanged: (value) {
          onTextChanged(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}