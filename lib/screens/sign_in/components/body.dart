import 'dart:convert';

import 'package:ecommerce/components/defaults_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/screens/login_success/login_success_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/components/defaults_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import '../../../../components/SocalCard.dart';
import '../../../../components/custtom_surfix_icon.dart';
import '../../../../components/form_error.dart';
import '../../../../components/no_account_text.dart';
import '../../../models/user.dart';
import '../../sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(s: "SignUp"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

User user = User(
  username: "",
  password: "",
);
var x = 0;

Future save() async {
  var res = await http.post(
      Uri.parse("http://192.168.1.102:8080/api/auth/signin"),
      headers: {'Content-Type': 'application/json'},
      body:
          json.encode({'username': user.username, 'password': user.password}));
  print(res.body);
  if (res.body != null) {
    x = 1;
    print(x);
  }
}

class _SignFormState extends State<SignForm> {
  final List<String> errors = ["ERROR"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildpasswordFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: "SignIn",
                press: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    _formKey.currentState?.save();
                    // save();
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                }),
          ],
        ),
      ),
    );
  }

  TextFormField buildpasswordFormField() {
    final List<String> errors = ["ERROR"];

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: MultiValidator([
        RequiredValidator(errorText: "* Required"),
        MinLengthValidator(6,
            errorText: "password should be atleast 6 characters"),
      ]),
      onChanged: (val) {
        user.password = val;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: MultiValidator([
        RequiredValidator(errorText: "* Required"),
        MinLengthValidator(6, errorText: "email should be atleast 6 characters")
      ]),
      onChanged: (val) {
        user.username = val;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
