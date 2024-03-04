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
      // for emolator
      // Response response = await _dio.get(
      //   'http://10.0.2.2/api/quotes',
      //   options: Options(
      //     headers: headers,
      //   ),
      // );
      // for real device
      Response response = await _dio.get(
        Routes.quotes,
        options: Options(
          headers: headers,
        ),
      );
      // print('response : ${response.data}');
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
      Quote quote_testing = Quote(
        id: null,
        desc_ar: 'houssam quote',
        desc_en: 'houssam quote 2',
        source_ar: 'houssam bouzidi',
        source_en: 'houssam bouzidi',
        category_id: 4,
      );
      // Use the Dio instance to send a POST request
      Response response = await _dio.post(
        Routes.quotes,
        data: quote_testing.toJson(), // Assuming Quote has a toJson() method
        options: Options(
          headers: {
            // 'Authorization': 'Bearer YourAccessToken',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      // Handle the response (if needed)
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
