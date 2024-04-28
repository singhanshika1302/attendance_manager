import 'package:flutter/material.dart';

class customTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const customTextFormField(
      {super.key, required this.controller, required this.text});

  @override
  State<customTextFormField> createState() => _customTextFormFieldState();
}

class _customTextFormFieldState extends State<customTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15)),
          labelText: widget.text,
        ),
      ),
    );
  }
}