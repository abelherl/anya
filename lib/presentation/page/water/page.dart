import 'package:anya/presentation/config/route_config.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:anya/presentation/page/login/widget.dart';
import 'package:anya/presentation/page/water/widget.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class WaterPage extends StatefulWidget {
  @override
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  double _cupPerDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 786,
                child: Center(
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
                          "How many cups of water\ndo you drink every day?",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 34),
                        Center(
                          child: Container(
                            height: 300,
                            child: AspectRatio(
                              aspectRatio: 1/2.45,
                              child: ClipPath(
                                clipper: HumanClipper(),
                                child: LiquidLinearProgressIndicator(
                                  direction: Axis.vertical,
                                  value: _cupPerDay/15,
                                  backgroundColor : aLightTextColor.withAlpha(100),
                                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
                                  center: Parent(
                                    style: ParentStyle()
                                      ..linearGradient(colors: [Theme.of(context).primaryColor.withAlpha((_cupPerDay/15*255).toInt()), Colors.white.withAlpha(1)], begin: Alignment.bottomCenter, end: Alignment.topCenter,),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 80),
                                        Center(
                                          child: Text(
                                            '${_cupPerDay.toInt()}',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline5.copyWith(
                                              fontWeight: FontWeight.w500 ,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset('assets/icons/empty.svg', width: 24,),
                            Expanded(
                              child: SfSlider(
                                min: 0.0,
                                max: 15.0,
                                tooltipShape: SfPaddleTooltipShape(),
                                showTooltip: true,
                                thumbIcon: Parent(
                                  style: ParentStyle()
                                    ..width(24)
                                    ..height(24)
                                    ..background.color(Theme.of(context).primaryColor)
                                    ..borderRadius(all: 15)
                                    ..boxShadow(color: Colors.black26, spread: 1, blur: 5, offset: Offset(0, 3)),
                                ),
                                tooltipTextFormatterCallback: (_,text) {
                                  return '${double.parse(text).toInt()}';
                                },
                                value: _cupPerDay,
                                onChanged: (cup) => setState(() => _cupPerDay = cup),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/full.svg', color: Theme.of(context).primaryColor, width: 24,),
                          ],
                        ),
                        SizedBox(height: 25),
                        LoginButton(
                          title: "Next",
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
