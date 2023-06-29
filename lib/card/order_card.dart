import 'package:aj_catering/model/order_model.dart';
import 'package:aj_catering/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class OrderCard extends StatefulWidget {
  final OrderModel order;
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

bool? check = false;

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.displayHeight(context) * .08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.bgScreen,
      ),
      // ignore: prefer_const_constructors
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Utils.displayHeight(context),
            width: Utils.displayWidth(context) * 0.15,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(
                    child: Text(
                  widget.order.icon,
                  style: TextStyle(
                      color: AppColor.base,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          SizedBox(width: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Container(
              width: Utils.displayWidth(context) * 0.6,
              // color: Colors.lightBlueAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.order.name,
                    style: TextStyle(
                        fontSize: Utils.displayHeight(context) * 0.02,
                        fontWeight: FontWeight.w500),
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: widget.order.food,
                      style: TextStyle(
                          fontSize: Utils.displayHeight(context) * 0.015,
                          color: Colors.black54),
                    ),
                    TextSpan(
                        text: "+ ${widget.order.vegetable} ",
                        style: TextStyle(
                            fontSize: Utils.displayHeight(context) * 0.015,
                            color: Colors.black54)),
                    TextSpan(
                        text: "+ ${widget.order.fruit}",
                        style: TextStyle(
                            fontSize: Utils.displayHeight(context) * 0.015,
                            color: Colors.black54))
                  ])),
                ],
              ),
            ),
          ),
          Checkbox(
              //only check box
              value: check, //unchecked
              onChanged: (bool? value) {
                //value returned when checkbox is clicked
                setState(() {
                  check = value;
                });
              })
        ],
      ),
    );
  }
}
