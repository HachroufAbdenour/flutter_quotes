import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String labelText;

  const CustomLabel({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Arial',
        ),
      ),
    );
  }
}
