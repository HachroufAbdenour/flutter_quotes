import 'package:counter_getx/models/Quote_remote.dart';
import 'package:dio/dio.dart';

class QuoteRemoteRepository {
  final Dio _dio = Dio();

  Future<List<QuoteRemote>> fetchQuotes() async {
    print('begin');
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      Response response = await _dio.get(
        'http://10.0.2.2/api/quotes',
        options: Options(
          headers: headers,
        ),
      );
      print(response.data.toString());
      List<QuoteRemote> quotes = (response.data['data'] as List)
          .map((json) => QuoteRemote.fromJson(json))
          .toList();
      print('end');
      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch quotes');
    }
  }
}
