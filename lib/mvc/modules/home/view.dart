import 'package:counter_getx/mvc/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeQuotesScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make app bar transparent
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(
                        10), // Shape of the container (circle for a rounded background)
                    color: Colors.white, // Background color for the icon
                  ),
                  child: const Icon(
                    Icons.star,
                    color: Colors.black, // Color of the crown icon
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        extendBodyBehindAppBar: true, // Extend background behind app bar
        extendBody: true, //

        body: Obx(
          () => Stack(
            children: [
              // Background image widget (replace with your image fetching logic)
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/lion.jpg", // Replace with your image path
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Let there be work, bread, water and salt for all.",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "- Nelson Mandela",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //     shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(
                                  10), // Shape of the container (circle for a rounded background)
                              color:
                                  Colors.white, // Background color for the icon
                            ),
                            child: const Icon(
                              Icons.share,
                              color: Colors.black, // Color of the crown icon
                            ),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          onPressed: () {
                            homeController.changeFav();
                          },
                          icon: Icon(
                            Icons.heart_broken_rounded,
                            size: 40,
                            color: homeController.is_fav.value
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (homeController.is_fav.value)
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.heart_broken,
                    color: Colors.red,
                    size: 200,
                  ),
                ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       IconButton(
        //         icon: Icon(Icons.home),
        //         onPressed: () {
        //           // Add functionality for the home button
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.search),
        //         onPressed: () {
        //           // Add functionality for the search button
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.message),
        //         onPressed: () {
        //           // Add functionality for the messaging button
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.notifications),
        //         onPressed: () {
        //           // Add functionality for the notifications button
        //         },
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.more_vert),
        //         onPressed: () {
        //           // Add functionality for the menu button
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
