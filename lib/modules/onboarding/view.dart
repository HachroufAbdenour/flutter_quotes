import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final List<PageInfo> pages = [
    PageInfo(
      title: 'Page 1',
      description: 'Description for Page 1',
    ),
    PageInfo(
      title: 'Page 2',
      description: 'Description for Page 2',
    ),
    PageInfo(
      title: 'Page 3',
      description: 'Description for Page 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter PageView Example'),
        ),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return buildPage(pages[index]);
          },
        ));
  }

  Widget buildPage(PageInfo pageInfo) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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

  PageInfo({
    required this.title,
    required this.description,
  });
}
