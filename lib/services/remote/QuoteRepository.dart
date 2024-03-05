import 'package:counter_getx/models/Quote.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class QuoteRepository {
  final Dio _dio = Dio();

  Future<List<Quote>> fetchQuotes() async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      Response response = await _dio.get(
        Routes.quotes,
        options: Options(
          headers: headers,
        ),
      );

      List<Quote> quotes = (response.data['data'] as List)
          .map((json) => Quote.fromJson(json))
          .toList();
      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch quotes');
    }
  }

  Future<void> postQuote() async {
    try {
      Quote post_test = Quote(
        id: null,
        desc_ar: 'test quote',
        desc_en: 'test quote 2',
        source_ar: 'test source',
        source_en: 'test source 2',
        category_id: 4,
      );

      Response response = await _dio.post(
        Routes.quotes,
        data: post_test.toJson(),
        options: Options(
          headers: {
            // 'Authorization': 'Bearer YourAccessToken',
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST request successful');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw e; // Rethrow the error to be caught by the calling function
    }
  }
}
