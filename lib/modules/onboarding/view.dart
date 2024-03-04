import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  final List<PageInfo> pages = [
    PageInfo(
        title: 'Page 1',
        description: 'Description for Page 1',
        imagePath: 'assets/images/image1.png'),
    PageInfo(
        title: 'Page 2',
        description: 'Description for Page 2',
        imagePath: 'assets/images/image2.png'),
    PageInfo(
        title: 'Page 3',
        description: 'Description for Page 3',
        imagePath: 'assets/images/image3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter PageView Example'),
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(pageInfo: pages[index]);
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final PageInfo pageInfo;

  const OnboardingPage({Key? key, required this.pageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            pageInfo.imagePath,
            width: 400, // Adjust width as needed
            height: 450, // Adjust height as needed
          ),
          SizedBox(height: 16.0),
          Text(
            pageInfo.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            pageInfo.description,
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PageInfo {
  final String title;
  final String description;
  final String imagePath;

  PageInfo(
      {required this.title,
      required this.description,
      required this.imagePath});
}
