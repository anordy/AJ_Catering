import 'package:aj_catering/card/food_card.dart';
import 'package:aj_catering/model/food_model.dart';
import 'package:aj_catering/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = new ScrollController();

  int current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "assets/images/aj2.jpg",
    "assets/images/aj1.png",
  ];

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
            Expanded(
              child: Container(
                // color: Colors.grey,
                width: Utils.displayWidth(context),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 2.0, right: 2.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _greetings(),
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
                            InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => productView());
                                },
                                child: _foodWidget()),
                            const SizedBox(
                              height: 10,
                            ),
                            _adsWidget()
                          ],
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigate(BuildContext context, Widget screen, bool nav) {}

// greetings
  Widget _greetings() {
    return Container(
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
    );
  }

// ===== ADS BANNER ======
  Widget _adsWidget() {
    return Container(
      height: Utils.displayHeight(context) * 0.3,
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
                                      child: const Text(
                                        'We provide Good service',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))),
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
                  current = index;
                });
              })),
    );
  }

// food widget
  Widget _foodWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        height: Utils.displayHeight(context) * 0.4,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodModels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, childAspectRatio: 1.9),
          itemBuilder: (context, index) {
            return GridTile(
                child: FoodCard(
              food: foodModels[index],
            ));
          },
        ),
      ),
    );
  }

  // dismiss widget
  Widget makeDismisible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );

  Widget productView() {
    return makeDismisible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.7,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
              color: AppColor.bgScreen,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 70),
            child: ListView(
              controller: controller,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Rice',
                  style: TextStyle(color: Color(0xFF2D0C57), fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                _vegetables(),
                const SizedBox(
                  height: 15,
                ),
                _fruits(),
                const SizedBox(
                  height: 10.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: MaterialButton(
                    height: 50,
                    color: AppColor.shadow2,
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "ORDER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// vegetable menu
  Widget _vegetables() {
    bool _isVegetableChecked = false;
    bool _isotherVegetableChecked = false;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Vegetables",
              style: TextStyle(
                  color: AppColor.shadow1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _isVegetableChecked,
            onChanged: (bool? value) {
              setState(() {
                _isVegetableChecked = value!;
                if (_isVegetableChecked) {
                  _isotherVegetableChecked = false;
                }
              });
            },
            title: const Text("Chicken Roast"),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _isVegetableChecked,
            onChanged: (bool? value) {
              setState(() {
                _isVegetableChecked = value!;
                if (_isVegetableChecked) {
                  _isotherVegetableChecked = false;
                }
              });
            },
            title: const Text("Meat Roast"),
          ),
        ],
      ),
    );
  }

// fruits menu
  Widget _fruits() {
    bool _isfruitChecked = false;
    bool isOtherFruitChecked = false;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fruits",
              style: TextStyle(
                  color: AppColor.shadow1,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _isfruitChecked,
            onChanged: (bool? value) {
              setState(() {
                _isfruitChecked = value!;
                if (_isfruitChecked) {
                  isOtherFruitChecked = false;
                }
              });
            },
            title: const Text("Banana"),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _isfruitChecked,
            onChanged: (bool? value) {
              setState(() {
                _isfruitChecked = value!;
                if (_isfruitChecked) {
                  isOtherFruitChecked = false;
                }
              });
            },
            title: const Text("Pineapple"),
          ),
        ],
      ),
    );
  }
}
