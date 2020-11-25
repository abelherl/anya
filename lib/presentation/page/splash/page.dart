import 'dart:async';
import 'package:anya/presentation/config/route_config.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  SharedPreferences _sp;

  @override
  void initState() {
    // getSharedPref();

    Future.delayed(Duration(milliseconds: 1000), () {
      App.main.router.navigate(
        RouteName.login,
        navigationType: NavigationType.pushReplace,
        transitions: [SailorTransition.fade_in],
        transitionDuration: Duration(milliseconds: 600),
      );
    });
    super.initState();
  }

  // void getSharedPref() async {
  //   _sp = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Parent(
        style: ParentStyle()
          ..linearGradient(colors: [aPurple1, aPurple2], begin: Alignment.bottomLeft, end: Alignment.topRight),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/app-icon.svg',
            width: 100,
          ),
        ),
      ),
    );
  }
}
