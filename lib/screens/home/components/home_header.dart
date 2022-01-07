import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'Icon_btn_with_counter.dart';
import 'Search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          SearchField(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8)),
            child: IconBtnwithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              numOfItems: 4,
              press: () {},
            ),
          ),
          IconBtnwithCounter(
            press: () {},
            numOfItems: 3,
            svgSrc: "assets/icons/Bell.svg",
          )
        ],
      ),
    );
  }
}
