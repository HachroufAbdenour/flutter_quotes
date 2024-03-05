import 'package:counter_getx/modules/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PageInfo {
  final String title;
  final String description;
  final String imagePath;

  PageInfo(
      {required this.title,
      required this.description,
      required this.imagePath});
}

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
    PageInfo(
        title: 'Page 3',
        description: 'Description for Page 3',
        imagePath: 'assets/images/image3.png'),
  ];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: LinearPercentIndicator(
            width: 150.0,
            lineHeight: 16.0,
            percent: index / (pages.length - 1),
            center: Text(
              "${index}/${(pages.length - 1).toString()}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.amber,
            barRadius: const Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(pageInfo: pages[index], index: index);
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final PageInfo pageInfo;
  final int index;

  const OnboardingPage({Key? key, required this.pageInfo, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          pageInfo.imagePath,
          width: 400,
          height: 450,
        ),
        const SizedBox(height: 16.0),
        index == 3
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.amber,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(() => HomeQuotesScreen());
                  },
                ),
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    pageInfo.title,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    pageInfo.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
      ],
    );
  }
}
