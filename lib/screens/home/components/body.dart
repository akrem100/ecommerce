import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/home/components/popular_product.dart';
import 'package:ecommerce/screens/home/components/product_card.dart';
import 'package:ecommerce/screens/home/components/sectiontitle.dart';
import 'package:ecommerce/screens/home/components/special_offer.dart';
import 'package:ecommerce/screens/home/components/special_offre_card.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Icon_btn_with_counter.dart';
import 'Search_field.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          HomeHeader(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DiscountBanner(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Categories(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          SpecialOffer(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          SectionTitle(
            text: "Popular Product",
            press: () => {},
          ),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          PopularProduct(),
        ],
      ),
    ));
  }
}
