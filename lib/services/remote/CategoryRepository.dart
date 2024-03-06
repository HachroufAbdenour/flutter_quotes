import 'package:counter_getx/models/Category.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class CategoryRepository {
  final Dio _dio = Dio();

  Future<List<Category>> fetchQuotesCategories() async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      Response response = await _dio.get(
        Routes.categories,
        options: Options(
          headers: headers,
        ),
      );
      print("Categories:${response.data['data']}");
      List<Category> categories = (response.data['data'] as List)
          .map((json) => Category.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<void> postQuoteCategory() async {
    try {
      Category post_test = Category(
        id: null,
        name: 'test name',
        logo: 'test logo',
        is_free: 1,
        type: 'quote',
      );

      Response response = await _dio.post(
        Routes.categories,
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
      throw e;
    }
  }
}
