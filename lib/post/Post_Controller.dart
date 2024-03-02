import 'package:flutter/material.dart';
import 'package:counter_getx/post/post_repository.dart';
import 'package:counter_getx/post/Post_Model.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  var posts = <Post>[].obs;
  var isLoading = false.obs;



  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      List<Post> fetchedPosts = await _postRepository.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
