import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:counter_getx/post/post_controller.dart';
import 'package:counter_getx/post/post_model.dart';

class PostScreen extends StatelessWidget {
  final PostController _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Example'),
      ),
      body: Obx(() {
        return _postController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _postController.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: ListTile(
                      title: Text(
                        _postController.posts[index].title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_postController.posts[index].body),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _postController.fetchPosts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
