import 'package:flutter/material.dart';
import 'package:counter_getx/models/Category.dart';
import 'package:counter_getx/services/remote/CategoryRepository.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = false.obs;
  var count = 0.obs;
  // late

// inject
  final CategoryRepository _categoryRepository = CategoryRepository();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      List<Category> fetchedCategories =
          await _categoryRepository.fetchCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  /*
  Future<void> postUser() async {
    isLoading.value = true;
    try {
      CategoryItem catigoryItem = await _categoryRepository.storeUser({
        'user_name': 'usernameController.text',
        'gender': 'male',
        'type': 'client',
        'category_id': 1,
        'theme_id': 1,
      });
      user = catigoryItem;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }*/
}
