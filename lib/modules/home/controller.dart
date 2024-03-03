import 'package:counter_getx/models/Quote.dart';
import 'package:counter_getx/services/Quote_Repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var is_fav = false.obs;
  var quotes = <Quote>[].obs;
  var isLoading = false.obs;
  var count = 0.obs;
  final QuoteRepository _quoteRepository = QuoteRepository();

  @override
  Future<void> onInit() async {
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
}
