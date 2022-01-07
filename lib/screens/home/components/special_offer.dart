import 'package:ecommerce/screens/home/components/sectiontitle.dart';
import 'package:ecommerce/screens/home/components/special_offre_card.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "special for you",
          press: () => {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () => {},
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Watch",
                numOfBrands: 18,
                press: () => {},
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Fashion",
                numOfBrands: 18,
                press: () => {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
