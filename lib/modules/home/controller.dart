import 'dart:ffi';

import 'package:counter_getx/models/Category.dart';
import 'package:counter_getx/models/Quote.dart';
import 'package:counter_getx/models/User.dart';
import 'package:counter_getx/models/Theme.dart' as ITheme;
import 'package:counter_getx/services/remote/QuoteRepository.dart';
import 'package:counter_getx/services/remote/ThemeRepository.dart';
import 'package:counter_getx/services/remote/UserRepository.dart';
import 'package:counter_getx/services/remote/CategoryRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var is_fav = false.obs;
  // var quotes = <Quote>[].obs;
  var categories = <Category>[].obs;
  var themes = <ITheme.Theme>[].obs;
  var is_loading = false.obs;
  var count = 0.obs;
  var fetchedQuotes = [].obs;
  var fetchedCategoryName = ''.obs;

  TextEditingController usernameController = TextEditingController();
  var gender = 'male'.obs;
  // final QuoteRepository _quoteRepository = QuoteRepository();
  final UserRepository _userRepository = UserRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ThemeRepository _themeRepository = ThemeRepository();

  @override
  Future<void> onInit() async {
    // await fetchQuotes();
    await fetchQuotesCategories();
    await fetchThemes();
    super.onInit();
  }

  changeCount(int value) {
    count.value = value;
  }

  changeFav() {
    if (is_fav.value) {
      is_fav.value = false;
    } else {
      is_fav.value = true;
    }
  }

  // Future<void> fetchQuotes() async {
  //   is_loading.value = true;
  //   try {
  //     List<Quote> fetchedQuotes = await _quoteRepository.fetchQuotes();
  //     quotes.assignAll(fetchedQuotes);
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     is_loading.value = false;
  //   }
  // }

  Future<void> fetchQuotesCategories() async {
    is_loading.value = true;
    try {
      List<Category> fetchedQuotesCategories =
          await _categoryRepository.fetchQuotesCategories();
      categories.assignAll(fetchedQuotesCategories);
    } catch (e) {
      print(e.toString());
    } finally {
      is_loading.value = false;
    }
  }

  Future<void> fetchThemes() async {
    is_loading.value = true;
    try {
      List<ITheme.Theme> fetchedThemes = await _themeRepository.fetchThemes();
      themes.assignAll(fetchedThemes);
    } catch (e) {
      print(e.toString());
    } finally {
      is_loading.value = false;
    }
  }

  // Future<void> PostQuotes() async {
  //   is_loading.value = true;
  //   try {
  //     await _quoteRepository.postQuote();
  //     // await fetchQuotes();
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     is_loading.value = false;
  //   }
  // }

  Future<void> postUser() async {
    is_loading.value = true;
    try {
      UserItem userItem = await _userRepository.storeUser({
        'user_name': usernameController.text,
        'gender': gender.value,
        'type': 'client',
        'category_id': 1,
        'theme_id': 2,
      });
      fetchedCategoryName.value = userItem.category.category.name;
      fetchedQuotes.value = userItem.category.quotes;
    } catch (e) {
      print(e.toString());
    } finally {
      is_loading.value = false;
    }
  }
}
