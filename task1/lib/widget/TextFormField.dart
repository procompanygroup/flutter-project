import 'package:flutter/material.dart';

class TFormFiled extends StatelessWidget {
  final fValidator, fOnSaved, labelName, keyv;
  const TFormFiled({this.keyv, this.fValidator, this.fOnSaved, this.labelName});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: ValueKey(key),
        validator: fValidator,
        onSaved: fOnSaved,
        decoration: InputDecoration(
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: labelName,
            labelStyle: const TextStyle(color: Colors.black38),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            border: InputBorder.none));
  }
}
