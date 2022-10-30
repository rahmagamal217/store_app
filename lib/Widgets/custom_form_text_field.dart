import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {Key? key,
      this.hintText,
      this.inputType,
      this.onChanged,
      this.obscuretext = false})
      : super(key: key);

  final String? hintText;
  Function(String)? onChanged;
  bool? obscuretext;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext!,
      keyboardType: inputType,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
