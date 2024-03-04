import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final String? label;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    this.icon,
    this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        icon: icon,
        label: Text(
          label!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
