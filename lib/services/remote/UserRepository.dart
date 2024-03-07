import 'dart:convert';

import 'package:counter_getx/models/User.dart';
import 'package:dio/dio.dart';

import '../../core/values/routes.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<UserItem> GetUserById(int id) async {
    try {
      Map<String, dynamic> headers = {
        // 'Authorization': 'Bearer YourAccessToken',
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      // for emolator
      // Response response = await _dio.get(
      //   'http://10.0.2.2/api/Users',
      //   options: Options(
      //     headers: headers,
      //   ),
      // );
      // for real device
      Response response = await _dio.get(
        '${Routes.users}/$id',
        options: Options(
          headers: headers,
        ),
      );
      print('response : ${response.data}');
      UserItem user = UserItem.fromJson(response.data['data']);
      return user;
    } catch (e) {
      throw Exception('Failed to get User by id ');
    }
  }

  Future<UserItem> storeUser(Map<String, dynamic> user) async {
    try {
      // Use the Dio instance to send a POST request
      print(user.toString());
      Response response = await _dio.post(
        Routes.users,
        data: user, // Assuming User has a toJson() method
        options: Options(
          headers: {
            // 'Authorization': 'Bearer YourAccessToken',
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print('before :' + response.data.toString());
      // Handle the response (if needed)
      print('eeeeeee' + UserItem.fromJson(response.data['data']).toString());
      UserItem userData = UserItem.fromJson(response.data['data']);
      print('end : d ');
      if (response.statusCode == 201) {
        print('POST request successful');
        return userData;
      } else {
        print('Error 1: ${response.statusCode}');
        return userData;
      }
    } catch (e) {
      print('Error 2: $e');
      throw e; // Rethrow the error to be caught by the calling function
    }
  }
}
