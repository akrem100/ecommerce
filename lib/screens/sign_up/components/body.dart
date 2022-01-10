import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import '../../../../components/SocalCard.dart';
import '../../../../components/custtom_surfix_icon.dart';
import '../../../../components/defaults_button.dart';
import '../../../../components/form_error.dart';
import '../../../../components/no_account_text.dart';
import '../../../models/user.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Register Account", style: headingStyle),
              Text(
                "Complete your details",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              SignUpForm(),
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
              NoAccountText(s: "SignIn"),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String conform_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  User user = User(
      username: "",
      password: "",
      lastName: "",
      firstName: "",
      email: "",
      phone: "",
      adresse: "",
      roles: [""]);
  var x = 0;

  Future save() async {
    var res =
        await http.post(Uri.parse("http://192.168.1.102:8080/api/auth/signup"),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'username': user.username,
              'password': user.password,
              'lastName': user.lastName,
              'firstName': user.firstName,
              'email': user.email,
              'phone': user.phone,
              'adresse': user.adresse,
              'roles': user.roles
            }));
    print(res.body);
    if (res.body != null) {
      x = 1;
      print(x);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildpasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildConformPassFormField(),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(40)),
                DefaultButton(
                  text: "Continue 1/2",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //save();
                      Navigator.pushNamed(
                          context, CompleteProfileScreen.routeName);

                      //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      /*
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },*/
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
            errorText: "password should be atleast 6 characters")
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
