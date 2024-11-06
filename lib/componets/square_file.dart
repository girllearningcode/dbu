import 'package:flutter/material.dart';

class SquareFile extends StatelessWidget {
  final String imagepath;
  const SquareFile({
    super.key,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagepath,
        height: 40,
      ),
    );
  }
}
