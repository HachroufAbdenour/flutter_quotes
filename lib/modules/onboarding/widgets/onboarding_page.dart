import 'package:counter_getx/modules/home/controller.dart';
import 'package:counter_getx/modules/home/view.dart';
import 'package:counter_getx/modules/onboarding/view.dart';
import 'package:counter_getx/modules/onboarding/widgets/custom_textfield.dart';
import 'package:counter_getx/modules/onboarding/widgets/custom_textfieldgender.dart';
import 'package:counter_getx/modules/onboarding/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final int index;
  final PageInfo pageInfo;
  HomeController homeController = Get.put(HomeController());

  OnboardingPage({
    super.key,
    required this.index,
    required this.pageInfo,
  });

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
                    Get.to(() => const HomeQuotesScreen());
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
                      : const Text(
                          "hi Welcome in Our Quotes App ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
        ],
      ),
    );
  }
}
