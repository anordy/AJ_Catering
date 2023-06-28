
import 'package:aj_catering/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';



class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "assets/images/aj1.png",
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Anord John",
                  style: TextStyle(fontSize: Utils.displayHeight(context)* 0.015, fontWeight: FontWeight.w500),
                ),
                 Text(
                  "Wali kuku",
                  style:  TextStyle(fontSize: Utils.displayHeight(context)* 0.008, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
