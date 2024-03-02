import 'package:dio/dio.dart';
import 'package:counter_getx/post/Post_Model.dart';

class PostRepository {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      List<Post> posts =
          (response.data as List).map((json) => Post.fromJson(json)).toList();
      return posts;
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}
