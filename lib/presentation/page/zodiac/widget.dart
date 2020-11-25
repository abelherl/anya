import 'package:anya/presentation/core/constant_styling.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ZodiacButton extends StatefulWidget {
  ZodiacButton(this.zodiac, this.picked, this.onPressed);

  Function(String) onPressed;
  String zodiac;
  bool picked;

  @override
  _ZodiacButtonState createState() => _ZodiacButtonState();
}

class _ZodiacButtonState extends State<ZodiacButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Parent(
          gesture: Gestures()
            ..onTap(() {
              widget.onPressed(widget.zodiac);
            }),
          style: ParentStyle()
            ..height(90)
            ..width(90)
            ..borderRadius(all: 8)
            ..boxShadow(color: widget.picked ? Colors.transparent : Colors.black12, spread: -3, blur: 8, offset: Offset(0, 3))
            ..animate(500, Curves.easeOutCirc)
            ..linearGradient(colors: !widget.picked ? [Colors.white, Colors.white] : [Theme.of(context).primaryColor, Theme.of(context).accentColor], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          child: Center(child: SvgPicture.asset('assets/icons/${widget.zodiac.toLowerCase()}.svg', color: widget.picked ? Colors.white : null,)),
        ),
        SizedBox(height: 12),
        Text(
          widget.zodiac,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
