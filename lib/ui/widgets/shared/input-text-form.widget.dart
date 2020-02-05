import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputTextForm extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final String Function() errorText;
  final TextInputType textInputType;
  final bool obscureText;
  final IconData icon;

  InputTextForm(
      {this.labelText,
      this.onChanged,
      this.errorText,
      this.textInputType,
      this.obscureText,
      this.icon});

  Widget build(BuildContext context) {
    return Container(
      child: Observer(builder: (_) {
        return TextField(
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            labelText: labelText,
            errorText: errorText == null ? null : errorText(),
            border: OutlineInputBorder(),
          ),
        );
      }),
    );
  }
}
