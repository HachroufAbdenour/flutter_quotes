import 'package:counter_getx/modules/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:counter_getx/modules/onboarding/controller.dart';

class PageInfo {
  final String title;
  final String description;
  final String imagePath;

  PageInfo({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  var index = 0.obs;

  final List<PageInfo> pages = [
    PageInfo(
      title: 'Page 0',
      description: 'Description for Page 0',
      imagePath: 'assets/images/image1.png',
    ),
    PageInfo(
      title: 'Page 1',
      description: 'Description for Page 1',
      imagePath: 'assets/images/image2.png',
    ),
    PageInfo(
      title: 'Page 2',
      description: 'Description for Page 2',
      imagePath: 'assets/images/image3.png',
    ),
    PageInfo(
      title: 'Page 3',
      description: 'Description for Page 3',
      imagePath: 'assets/images/image1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Obx(
            () => LinearPercentIndicator(
              width: 150.0,
              lineHeight: 16.0,
              percent: index.value / (pages.length - 1),
              center: Text(
                "${index.value}/${(pages.length - 1).toString()}",
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.grey,
              progressColor: Colors.amber,
              barRadius: const Radius.circular(50),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          index.value = value;
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(pageInfo: pages[index], index: index);
        },
      ),
    );
  }
}
