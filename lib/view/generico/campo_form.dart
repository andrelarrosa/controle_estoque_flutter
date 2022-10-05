import 'package:flutter/material.dart';

class CampoForm extends StatelessWidget {
  final ValueChanged function;
  final String labelDecoration;
  const CampoForm(
      {Key? key, required this.function, required this.labelDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFormField(
        decoration: InputDecoration(label: Text(labelDecoration)),
        onChanged: function,
      )
    );
  }
}
