import 'package:counter_getx/core/values/api_key.dart';
import 'package:counter_getx/modules/onboarding/view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = ApiKeys.pusblishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}
