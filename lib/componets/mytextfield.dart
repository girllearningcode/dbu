import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintext;
  final bool obscuretext;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
          controller: controller,
          obscureText: obscuretext,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.teal.shade300,
            filled: true,
            hintText: hintext,
          )),
    );
  }
}
