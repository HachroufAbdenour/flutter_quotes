import 'package:counter_getx/models/Quote_remote.dart';
import 'package:counter_getx/services/remote/Quote_remote_Repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var is_fav = false.obs;
  var quotes = <QuoteRemote>[].obs;
  var isLoading = false.obs;
  var count = 0.obs;
  final QuoteRemoteRepository _quoteRepository = QuoteRemoteRepository();

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
      List<QuoteRemote> fetchedQuotes = await _quoteRepository.fetchQuotes();
      quotes.assignAll(fetchedQuotes);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
