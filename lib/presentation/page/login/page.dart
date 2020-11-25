import 'package:anya/helper/ui_helper.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:anya/presentation/page/login/widget.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height - 60,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: 400,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 15),
                          SvgPicture.asset(
                            'assets/icons/app-icon.svg',
                            width: 65,
                          ),
                          Spacer(),
                          LoginButton(
                            title: 'Login with Google',
                            assetPath: 'assets/icons/google.svg',
                          ),
                          SizedBox(height: 20),
                          LoginButton(
                            title: 'Login with Facebook',
                            assetPath: 'assets/icons/facebook.svg',
                          ),
                          Stack(
                            children: [
                              Divider(
                                color: aLightTextColor.withAlpha(90),
                                height: 84,
                                thickness: 1,
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    child: Text(
                                      'Or login with email',
                                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          LoginTextField(
                            controller: _userEmailController,
                            hintText: 'Email Address',
                          ),
                          SizedBox(height: 16),
                          LoginTextField(
                            controller: _userPasswordController,
                            hintText: 'Password',
                          ),
                          SizedBox(height: 20),
                          LoginButton(
                            title: "Login",
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
