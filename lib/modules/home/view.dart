import 'package:counter_getx/modules/home/controller.dart';
import 'package:counter_getx/modules/home/widgets/bottom_sheet_filter_quote_category.dart';
import 'package:counter_getx/modules/home/widgets/bottom_sheet_filter_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeQuotesScreen extends StatefulWidget {
  const HomeQuotesScreen({super.key});
  @override
  State<HomeQuotesScreen> createState() => _HomeQuotesScreenState();
}

class _HomeQuotesScreenState extends State<HomeQuotesScreen>
    with TickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.is_loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Obx(
                  () => Text(
                    '${(homeController.count.value + 1).toString()}/${(homeController.fetchedQuotes.length).toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/loin.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Obx(
                    () => PageView.builder(
                      onPageChanged: (value) =>
                          homeController.changeCount(value),
                      scrollDirection: Axis.vertical,
                      itemCount: homeController.fetchedQuotes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          homeController
                                              .fetchedQuotes[index].desc_ar,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        homeController
                                            .fetchedQuotes[index].source_ar,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          //     shape: BoxShape.circle,
                                          borderRadius: BorderRadius.circular(
                                              10), // Shape of the container (circle for a rounded background)
                                          color: Colors
                                              .white, // Background color for the icon
                                        ),
                                        child: const Icon(
                                          Icons.share,
                                          color: Colors
                                              .black, // Color of the crown icon
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        homeController.changeFav();
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 40,
                                        color: homeController.is_fav.value
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 20,
                      ),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.white,
                        icon: const Icon(
                          Icons.category,
                          color: Colors.black,
                        ),
                        label: Obx(
                          () => Text(
                            homeController.fetchedCategoryName.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        onPressed: () {
                          showCategorySheet(
                              context: context,
                              options: homeController.categories);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        left: 270,
                      ),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              showThemeSheet(
                                  context: context,
                                  options: homeController.themes);
                            },
                            child: const Icon(
                              Icons.palette,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            child: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (homeController.is_fav.value)
                    Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        'assets/lotties/love.json',
                        width: 200,
                        height: 200,
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = composition.duration
                            ..forward();
                        },
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
