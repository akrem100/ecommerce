import 'package:ecommerce/screens/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom_bav_bar.dart';
import '../../enum.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
