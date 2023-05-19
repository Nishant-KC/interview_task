import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key, required this.hint, required this.controller,
  });
  final String hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          hintText: hint,
        ),
      ),
    );
  }
}
