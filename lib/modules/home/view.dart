import 'package:counter_getx/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../services/remote/payment/payment_manager.dart';

class HomeQuotesScreen extends StatefulWidget {
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
      () => homeController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Obx(
                  () => Text(
                    '${homeController.count.value.toString()}/${homeController.quotes.length.toString()}',
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
                      onPressed: () {
                        // showSheet(context);
                        // PaymentManager.makePayment(20, "USD");
                      },
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
                      itemCount: homeController.quotes.length,
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
                                          homeController.quotes[index].desc_ar,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        '- nilson mandila',
                                        style: TextStyle(
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
                                padding: const EdgeInsets.only(
                                  bottom: 80,
                                ),
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
                                        Icons.heart_broken_rounded,
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
                        left: 10,
                        bottom: 10,
                      ),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.white,
                        icon: const Icon(
                          Icons.category,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'value',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          showSheet(context);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 270,
                      ),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {
                              showSheet(context);
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

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1, //
        color: const Color.fromARGB(
            255, 227, 226, 226), //                  <--- border width here
      ),
    );
  }

  void showSheet(context) {
    const TextStyle(color: Colors.white, height: 1.4, fontSize: 16);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Property Type",
                            style: TextStyle(
                              color: Colors.grey[700],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Container(
                          width: double.infinity,
                          height: 40,
                          // decoration: myBoxDecoration(),
                          child: Stack(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Appartement & Unit",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ))),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: new Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.expand_more,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            new Flexible(
                              child: Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Min Price",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          )),
                                    ),
                                  ),
                                  new Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: myBoxDecoration(),
                                      child: Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    new String.fromCharCodes(
                                                            new Runes(
                                                                '\u0024')) +
                                                        "50,000",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))),
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: new Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.expand_more,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              flex: 1,
                            ),
                            Container(
                              width: 40,
                            ),
                            new Flexible(
                              child: Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Max Price",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          )),
                                    ),
                                  ),
                                  new Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: myBoxDecoration(),
                                      child: Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    new String.fromCharCodes(
                                                            new Runes(
                                                                '\u0024')) +
                                                        "50,000",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))),
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: new Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.expand_more,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              flex: 1,
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            new Flexible(
                              child: Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Min Bedrooms",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          )),
                                    ),
                                  ),
                                  new Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: myBoxDecoration(),
                                      child: Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("2",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))),
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: new Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.expand_more,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              flex: 1,
                            ),
                            Container(
                              width: 40,
                            ),
                            new Flexible(
                              child: Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Max Bedrooms",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          )),
                                    ),
                                  ),
                                  new Container(
                                      width: double.infinity,
                                      height: 40,
                                      decoration: myBoxDecoration(),
                                      child: Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("6",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ))),
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: new Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.expand_more,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              flex: 1,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Min Land Size ( m\u00B2 )",
                            style: TextStyle(
                              color: Colors.grey[700],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Container(
                          width: double.infinity,
                          height: 40,
                          decoration: myBoxDecoration(),
                          child: Stack(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: new Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("400",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ))),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: new Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.expand_more,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          width: double.infinity, // match_parent
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text(
                              "SEARCH",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        )),
                    Container(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
