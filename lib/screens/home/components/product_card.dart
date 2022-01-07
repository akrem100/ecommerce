import 'package:ecommerce/screens/home/components/sectiontitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width;
  final double aspectRetion;
  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: GestureDetector(
          onTap: press,
          child: SizedBox(
            width: getProportionateScreenWidth(width),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: aspectRetion,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.asset(product.images[0]),
                  ),
                ),
                Text(
                  product.title,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Text(
                      "${product.price}",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        width: getProportionateScreenWidth(28),
                        height: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: product.isFavourite
                              ? kSecondaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: product.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
