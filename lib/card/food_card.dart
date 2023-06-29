import 'package:aj_catering/model/food_model.dart';
import 'package:aj_catering/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: Utils.displayHeight(context) * 0.23,
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child:  ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child:
                    Image(fit: BoxFit.cover, image: AssetImage(food.image)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              food.name,
              style: const TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      elevation: 0,
                      height: 50,
                      minWidth: 35,
                      color: AppColor.bgScreen2,
                      onPressed: () {},
                      child: const Icon(
                        Icons.remove,
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
                        Icons.shopping_cart_checkout_outlined,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
