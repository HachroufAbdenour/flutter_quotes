import 'package:counter_getx/models/Category.dart';
import 'package:flutter/material.dart';

class BottomSlideDialogCategory extends StatelessWidget {
  BottomSlideDialogCategory({super.key, required this.options});
  final List<Category> options;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: _buildOptions(context),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions(BuildContext context) {
    List<Widget> widgets = [];
    for (Category option in options) {
      widgets.add(
        ListTile(
          title: Text(option.name),
          onTap: () {
            // Handle the tapped option here
            print('Selected option: $option');
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      );
    }
    return widgets;
  }
}
