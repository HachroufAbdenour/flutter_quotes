import 'package:counter_getx/modules/home/controller.dart';
import 'package:counter_getx/modules/onboarding/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:counter_getx/modules/home/view.dart';
import 'package:counter_getx/modules/onboarding/widget/custom_textfieldgender.dart';
import 'package:counter_getx/modules/onboarding/widget/custom_textfield.dart';

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
        title: 'Page 4',
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
            barRadius: const Radius.circular(50),
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
  final int index;
  final PageInfo pageInfo;

  HomeController homeController = Get.put(HomeController());

  OnboardingPage({Key? key, required this.index, required this.pageInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              ? CustomButton(
                  icon: const Icon(Icons.slow_motion_video_sharp),
                  label: 'Start',
                  onPressed: () {
                    homeController.postUser();
                    Get.to(() => HomeQuotesScreen());
                  },
                )
              : index == 2
                  ? CustomGenderField()
                  : index == 1
                      ? Column(
                          children: [
                            const SizedBox(height: 8.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: CustomTextField(
                                labelText: 'Enter Username',
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "hi Welcome in Our Quotes App ",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          // CustomButton(
          //   icon: const Icon(Icons.slow_motion_video_sharp),
          //   label: 'Start',
          //   onPressed: () {
          //     homeController.postUser();
          //     Get.to(() => HomeQuotesScreen());
          //   },
          // )
        ],
      ),
    );
  }
}
