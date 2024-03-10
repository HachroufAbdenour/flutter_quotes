import 'package:counter_getx/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;

  HomeController homeController = Get.put(HomeController());

  CustomTextField({
    Key? key,
    this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: homeController.usernameController,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
