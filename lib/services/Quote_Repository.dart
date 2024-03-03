import 'package:counter_getx/models/Quote.dart';
import 'package:dio/dio.dart';

class QuoteRepository {
  final Dio _dio = Dio();

  Future<List<Quote>> fetchQuotes() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      List<Quote> quotes =
          (response.data as List).map((json) => Quote.fromJson(json)).toList();
      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}
