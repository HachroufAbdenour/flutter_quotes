import 'package:counter_getx/mvc/modules/home/view.dart';
import 'package:counter_getx/post/Post_Screen.dart';
import 'package:flutter/material.dart';
import 'package:counter_getx/mvc/view/Home_Screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeQuotesScreen(),
    );
  }
}
