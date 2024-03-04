import 'package:counter_getx/models/Category.dart';
import 'package:counter_getx/models/Quote.dart';
import 'package:counter_getx/models/User.dart';
import 'package:counter_getx/services/remote/QuoteRepository.dart';
import 'package:counter_getx/services/remote/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var is_fav = false.obs;
  var quotes = <Quote>[].obs;
  var isLoading = false.obs;
  var count = 0.obs;
  late UserItem user;

  TextEditingController usernameController = TextEditingController();
  var is_male = false.obs;
  final QuoteRepository _quoteRepository = QuoteRepository();
  final UserRepository _userRepository = UserRepository();

  @override
  Future<void> onInit() async {
    //   await PostQuotes();
    await fetchQuotes();
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

  Future<void> fetchQuotes() async {
    isLoading.value = true;
    try {
      List<Quote> fetchedQuotes = await _quoteRepository.fetchQuotes();
      quotes.assignAll(fetchedQuotes);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> PostQuotes() async {
    isLoading.value = true;
    try {
      await _quoteRepository.postQuote();
      // await fetchQuotes();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postUser() async {
    isLoading.value = true;
    try {
      UserItem userItem = await _userRepository.storeUser({
        'user_name': usernameController.text,
        'gender': 'male',
        'type': 'client',
        'category_id': 1.toString(),
        'theme_id': 1.toString(),
      });
      user = userItem;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
