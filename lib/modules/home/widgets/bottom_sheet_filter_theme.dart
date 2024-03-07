import 'package:flutter/material.dart';
import 'package:counter_getx/models/Theme.dart' as ITheme;
import 'package:get/get.dart';

void showThemeSheet({context, required List<ITheme.Theme> options}) {
  const TextStyle(color: Colors.white, height: 1.4, fontSize: 16);
  showModalBottomSheet(
      // scrollControlDisabledMaxHeightRatio:
      //     MediaQuery.of(context).size.height * 0.8,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Theme",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 35)),
                      ),
                    ),
                    for (ITheme.Theme option in options)
                      ListTile(
                        title: Text(option.font_en),
                        onTap: () {
                          // Handle onTap event for each option
                          print("Option selected: $option");
                          Get.back(); // Close the bottom sheet after an option is selected
                        },
                      ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          width: double.infinity, // match_parent
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              "CHANGE",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )),
                    Container(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
