import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/details/components/product_images.dart';
import 'package:ecommerce/screens/details/components/productdescription.dart';
import 'package:ecommerce/screens/details/components/top_rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../components/defaults_button.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'dot_color.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            Navigator.pushNamed(context, CartScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
