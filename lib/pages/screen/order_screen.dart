import 'package:aj_catering/card/order_card.dart';
import 'package:aj_catering/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  ScrollController _ordersController = new ScrollController();
  TabController? _tabController;
  List<Widget> list = [
    const Tab(
      text: "PENDING",
    ),
    const Tab(
      text: "COMPLETED",
    ),
  ];
  final statusList = ['Pending', 'Paid'];

  bool changeLanguage = false;
  String currentLocale = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.bgScreen2,
        // appBar: AppBar(
        //   title: Text("Order History"),
        // ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverStickyHeader(
                header: Container(
                  height: 140,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Order',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF292C34),
                                  fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {
                              
                                
                              },
                              child: Container(
                                  height: 30,
                                  width: 83,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: const Color(0xFFC7D3DD))),
                                  // ignore: prefer_const_constructors
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Icon(
                                        Icons.filter_alt_outlined,
                                        color: Color(0xFF000000),
                                        size: 18,
                                      ),
                                      Text(
                                        'filter',
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 14),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFD9D0E3)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: TabBar(
                              tabAlignment: TabAlignment.fill,
                              indicatorSize: TabBarIndicatorSize.tab,
                              controller: _tabController,
                              indicator: BoxDecoration(
                                  color: AppColor.base,
                                  borderRadius: BorderRadius.circular(15)),
                              // indicatorColor: AppColor.base,
                              labelColor: Colors.white,
                              unselectedLabelColor: const Color(0xFF1F212C),
                              tabs: list,
                              onTap: (index) {
                                // Tab index when user select it, it start from zero
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    height: Utils.displayHeight(context),
                    color: Colors.transparent,
                    child: TabBarView(controller: _tabController, children: [
                      pendingOrder(),
                      completeOrder(),
                    ]),
                  ),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pendingOrder() {
    return Container(
        height: Utils.displayHeight(context),
        // color: Colors.green,
        child: ListView.builder(
            //  controller: _ordersController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: orderModels.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 5.0, top:5),
                  child: InkWell(onTap: () {}, child:  OrderCard(order: orderModels[index],)));
            }));
  }

// ===== ORDER PLACED  =======
  Widget completeOrder() {
    return Container(
        height: Utils.displayHeight(context),
        // color: Colors.green,
        child: ListView.builder(
            //  controller: _ordersController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 5.0, top: 5),
                  child: InkWell(onTap: () {}, child:  OrderCard(order: orderModels[index],)));
            }));
  }
}
