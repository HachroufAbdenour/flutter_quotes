import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:counter_getx/modules/categories/controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Obx(() {
        // Obx rebuilds whenever categoriesController.categories changes
        if (categoriesController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
              childAspectRatio: 1.0, // aspect ratio of each child
            ),
            itemCount: categoriesController.categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = categoriesController.categories[index];
              IconData iconData = Icons.category; // Default icon

              return Card(
                child: InkWell(
                  onTap: () {
                    print("Clicked on '${category.name}'");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(category.logo),
                      Icon(iconData),
                      SizedBox(height: 8.0),
                      Text(category.name),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
