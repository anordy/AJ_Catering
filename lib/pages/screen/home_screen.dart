import 'package:aj_catering/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = new ScrollController();

  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "assets/images/aj2.jpg",
    "assets/images/aj1.png",
  ];
  final List dummyData = List.generate(10000, (index) => '$index');

  final List numbers = List.generate(4, (index) => "Item $index");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgScreen2,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Utils.displayHeight(context) * 0.82,
              width: Utils.displayWidth(context),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 2.0, right: 2.0, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: const TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: "Hey",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: " Anord.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4FBA6F))),
                                ])),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                    text: const TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: "Please Choose Your \n",
                                    style: TextStyle(
                                        fontSize: 25,
                                        wordSpacing: 7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: "Best Meal",
                                      style: TextStyle(
                                          fontSize: 25,
                                          wordSpacing: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ])),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF292C34)),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              height: Utils.displayHeight(context) * 0.4,
                              // color: Colors.grey,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.9),
                                itemBuilder: (context, index) {
                                  return GridTile(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Container(
                                              height:
                                                  Utils.displayHeight(context) *
                                                      0.25,
                                              decoration: const BoxDecoration(
                                                  color: Colors.lightBlue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: const ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                                child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/images/food2.jpg")),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Rice",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 60,
                                                // color: Colors.grey,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    MaterialButton(
                                                    
                                                      elevation: 0,
                                                      height: 50,
                                                      minWidth: 35,
                                                      color: AppColor.bgScreen2,
                                                      onPressed: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .remove,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      elevation: 0,
                                                      height: 50,
                                                      minWidth: 35,
                                                      color: AppColor.bgScreen2,
                                                      onPressed: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .shopping_cart_checkout_outlined,
                                                        color: Colors.black54,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )

                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.all(8.0),
                                            //   child: Container(
                                            //     height: Utils.displayHeight(
                                            //             context) *
                                            //         0.05,
                                            //     width: Utils.displayWidth(
                                            //             context) *
                                            //         0.6,
                                            //     decoration: BoxDecoration(
                                            //         color: AppColor.btnColor),
                                            //     child: const Center(
                                            //         child: Row(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.center,
                                            //       children: [
                                            //         Icon(
                                            //           Icons
                                            //               .shopping_basket_outlined,
                                            //           color: Colors.white,
                                            //         ),
                                            //         SizedBox(
                                            //           width: 5,
                                            //         ),
                                            //         Text(
                                            //           "ORDER",
                                            //           style: TextStyle(
                                            //               color: Colors.white,
                                            //               fontSize: 16,
                                            //               fontWeight:
                                            //                   FontWeight.w400),
                                            //         ),
                                            //       ],
                                            //     )),
                                            //   ),
                                            // )
                                          ],
                                        )),
                                  ));
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _adsWidget(),
                        ],
                      ),
                    ),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigate(BuildContext context, Widget screen, bool nav) {}

// ===== ADS BANNER ======
  Widget _adsWidget() {
    return Container(
      height: Utils.displayHeight(context) * 0.25,
      // color: Colors.brown,
      width: Utils.displayWidth(context),
      child: CarouselSlider(
          carouselController: _controller,
          items: imgList
              .map((item) => Container(
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(item,
                                  fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  // ignore: prefer_const_constructors
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              height: Utils.displayHeight(context) * 0.3,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              })),
    );
  }

// ===== List Service Widget ======
  Widget _serviceListWidget(String image, String title, String subtitle) {
    return Container(
      height: Utils.displayHeight(context) * .1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.bgScreen,
      ),
      // ignore: prefer_const_constructors
      child: Row(
        children: [
          Container(
            height: Utils.displayHeight(context),
            width: Utils.displayWidth(context) * 0.25,
            decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: Utils.displayHeight(context) * 0.015,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: Utils.displayHeight(context) * 0.008,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
