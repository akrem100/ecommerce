import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                        product: demoProducts[index],
                        press: () => Navigator.pushNamed(
                            context, DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: demoProducts[index])),
                      )),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
