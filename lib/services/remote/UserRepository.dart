
import 'package:counter_getx/models/User.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<UserItem> getUser(int id) async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      Response response = await _dio.get(
        '${Routes.users}/$id',
        options: Options(
          headers: headers,
        ),
      );
      UserItem user = UserItem.fromJson(response.data['data']);
      return user;
    } catch (e) {
      throw Exception('Failed to get User ');
    }
  }

  Future<UserItem> storeUser(Map<String, dynamic> user) async {
    try {
      Response response = await _dio.post(
        Routes.users,
        data: user,
        options: Options(
          headers: {
            // 'Authorization': 'Bearer YourAccessToken',
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print(response.data['data']);
      print(user.toString());
      UserItem user_data = UserItem.fromJson(response.data['data']);
      if (response.statusCode == 201) {
        print('POST request successful');
        return user_data;
      } else {
        print('Error: ${response.statusCode}');
        return user_data;
      }
    } catch (e) {
      print('Error: $e');
      throw e; // Rethrow the error to be caught by the calling function
    }
  }
}
