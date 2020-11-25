import 'package:anya/presentation/core/constant_styling.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatefulWidget {
  LoginButton({
    this.title,
    this.assetPath,
    this.color = Colors.white,
    this.textColor = aDarkTextColor,
  });

  String assetPath;
  String title;
  Color color;
  Color textColor;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()
        ..isTap((tap) => setState(() => pressed = tap)),
      style: ParentStyle()
        ..ripple(true, highlightColor: Theme.of(context).primaryColor)
        ..borderRadius(all: 8)
        ..boxShadow(color: pressed ? Theme.of(context).accentColor.withAlpha(150) : aShadowColor, blur: 8, offset: Offset(0, 3))
        ..background.color(widget.color)
        ..scale(pressed ? 0.9 : 1)
        ..padding(all: 15)
        ..animate(400, Curves.easeOutCirc),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.assetPath == null ? Container() : SvgPicture.asset(
            widget.assetPath,
            color: pressed ? Colors.white : null,
            width: 25,
          ),
          widget.assetPath == null ? Container() : SizedBox(width: 10),
          Txt(
            widget.title,
            style: TxtStyle()
              ..fontFamily(aFontFamily)
              ..textColor(pressed ? Colors.white : widget.textColor)
              ..fontSize(16)
              ..fontWeight(FontWeight.w500)
              ..animate(400, Curves.easeOutQuart),
          ),
        ],
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  LoginTextField({
    @required this.controller,
    @required this.hintText,
  });

  TextEditingController controller;
  String hintText;

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      maxLength: 16,
      autofillHints: [AutofillHints.username],
      onChanged: (_) => setState((){}),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")),
      ],
      style: Theme.of(context).textTheme.bodyText1,
      obscureText: obscure,
      obscuringCharacter: '•',
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.all(15),
        fillColor: Colors.grey[50],
        filled: true,
        suffixIcon: widget.hintText.toLowerCase().contains("password") ? IconButton(
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: !obscure ? Theme.of(context).primaryColor : aLightTextColor,
            ),
            splashColor: Colors.transparent,
            onPressed: () => setState(() => obscure = !obscure),
          ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
          fontSize: 15,
          color: aLightTextColor.withAlpha(175),
        ),
      ),
    );
  }
}
