import 'package:ecommerce/screens/cart/components/body.dart';
import 'package:flutter/material.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "4 items",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
