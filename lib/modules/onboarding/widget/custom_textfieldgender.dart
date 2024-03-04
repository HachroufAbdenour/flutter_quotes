import 'package:flutter/material.dart';

class CustomGenderField extends StatefulWidget {
  @override
  _CustomGenderFieldState createState() => _CustomGenderFieldState();
}

class _CustomGenderFieldState extends State<CustomGenderField> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Center(
      // Wrap the widget with Center
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Align row content to center
                children: [
                  Radio<String>(
                    value: 'male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  const SizedBox(width: 16.0),
                  Radio<String>(
                    value: 'female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
