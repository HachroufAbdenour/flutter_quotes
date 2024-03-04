import 'package:counter_getx/models/Quote_remote.dart';
import 'package:dio/dio.dart';

class QuoteRemoteRepository {
  final Dio _dio = Dio();

  Future<List<QuoteRemote>> fetchQuotes() async {
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
        'http://192.168.8.105/api/quotes',
        options: Options(
          headers: headers,
        ),
      );
      print('response : ${response.data}');
      List<QuoteRemote> quotes = (response.data['data'] as List)
          .map((json) => QuoteRemote.fromJson(json))
          .toList();
      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch quotes');
    }
  }

  Future<void> postQuote() async {
    try {
      QuoteRemote quote_testing = QuoteRemote(
          id: null,
          desc_ar: 'houssam quote',
          desc_en: 'houssam quote 2',
          source_ar: 'houssam bouzidi',
          source_en: 'houssam bouzidi',
          category_id: 1);
      // Use the Dio instance to send a POST request
      Response response = await _dio.post(
        'http://10.0.2.2/api/quotes',
        data: quote_testing
            .toJson(), // Assuming QuoteRemote has a toJson() method
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
