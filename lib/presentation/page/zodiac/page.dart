import 'package:anya/presentation/config/route_config.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/page/login/widget.dart';
import 'package:anya/presentation/page/zodiac/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ZodiacPage extends StatefulWidget {
  @override
  _ZodiacPageState createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  List<String> zodiacs = [
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagitarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
  ];

  String picked = 'Libra';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 400,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/app-icon.svg',
                        width: 65,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Welcome, Anya",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "For the next step, which\nis your zodiac?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 34),
                      GridView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: (MediaQuery.of(context).size.width > 500) ? 4 : 3,
                          childAspectRatio: 0.75,
                        ),
                        children: zodiacs.map((e) => ZodiacButton(
                          e,
                          (e == picked),
                          (chosen) => setState(() => picked = chosen),
                        )).toList(),
                      ),
                      SizedBox(height: 40),
                      LoginButton(
                        title: "Next",
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () => App.main.router.navigate(RouteName.water),
                      ),
                      SizedBox(height: 15),
                      FlatButton(
                        onPressed: () => App.main.router.navigate(RouteName.water),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          'Skip for now',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
