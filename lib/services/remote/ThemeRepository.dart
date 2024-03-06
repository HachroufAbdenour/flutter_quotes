import 'package:counter_getx/models/Theme.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class ThemeRepository {
  final Dio _dio = Dio();

  Future<List<Theme>> fetchThemes() async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      Response response = await _dio.get(
        Routes.themes,
        options: Options(
          headers: headers,
        ),
      );
      print("Themes:${response.data['data']}");
      List<Theme> themes = (response.data['data'] as List)
          .map((json) => Theme.fromJson(json))
          .toList();
      return themes;
    } catch (e) {
      throw Exception('Failed to fetch themes');
    }
  }

  Future<void> postTheme() async {
    try {
      Theme post_test = Theme(
        id: null,
        font_en: 'test font',
        font_ar: 'test font 2',
        image: 'test.png',
        is_free: 1,
      );

      Response response = await _dio.post(
        Routes.themes,
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
