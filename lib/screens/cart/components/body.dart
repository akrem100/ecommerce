import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(demoCarts[0].product.images[0]),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Column(
              children: [
                Text(
                  demoCarts[0].product.title,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: "\$${demoCarts[0].product.price}",
                    style: TextStyle(color: kPrimaryColor),
                    children: [
                      TextSpan(
                        text: "x${demoCarts[0].numOfItems}",
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
