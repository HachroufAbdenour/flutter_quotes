import 'package:counter_getx/models/Category.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class CategoryRepository {
  final Dio _dio = Dio();

  Future<List<Category>> fetchCategories() async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      // for emolator
      // Response response = await _dio.get(
      //   'http://10.0.2.2/api/categories',
      //   options: Options(
      //     headers: headers,
      //   ),
      // );
      // for real device
      Response response = await _dio.get(
        Routes.categories,
        options: Options(
          headers: headers,
        ),
      );
      // print('response : ${response.data}');
      List<Category> categories = (response.data['data'] as List)
          .map((json) => Category.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<void> postCategories() async {
    try {
      Category categories_testing =
          Category(
            id: 1,
            name: "name", 
            logo: "logo", 
            isFree: 1, 
            type: "theme");
      // Use the Dio instance to send a POST request
      Response response = await _dio.post(
        Routes.categories,
        data: categories_testing.toJson(), // Assuming Quote has a toJson() method
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
