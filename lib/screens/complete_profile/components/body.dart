import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/complete_profile/components/complete_profile_form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Complete Profile",
              style: headingStyle,
            ),
            Text(
              "Complete your details or continue",
              textAlign: TextAlign.center,
            ),
            CompleteProfileForm()
          ],
        ),
      ),
    );
  }
}
