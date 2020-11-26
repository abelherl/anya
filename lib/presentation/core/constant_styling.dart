
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final deviceSize = (BuildContext context) => MediaQuery.of(context).size;

const aFontFamily = 'Rubik';

// Colors
const Color aBackgroundColor = const Color(0xFFEDF1F7);
const Color aDarkTextColor = const Color(0xFF222B45);
const Color aLightTextColor = const Color(0xFF8F9BB3);
const Color aInactiveColor = const Color(0xFFEDF1F7);
const Color aShadowColor = const Color(0x15333333);
const Color aBorderColor = const Color(0xFFCDCDCD);

const Color aPurple1 = const Color(0xFF7044E9);
const Color aPurple2 = const Color(0xFF8281DE);
const Color aRelax1 = const Color(0xFF3D57B5);
const Color aRelax2 = const Color(0xFF52CAD2);
const Color aSleep1 = const Color(0xFF253185);
const Color aSleep2 = const Color(0xFF7D60CA);
const Color aInspire1 = const Color(0xFFFC6076);
const Color aInspire2 = const Color(0xFFFF9944);
const Color aStress1 = const Color(0xFF16A085);
const Color aStress2 = const Color(0xFFF4D03F);
const Color aFocus1 = const Color(0xFF596164);
const Color aFocus2 = const Color(0xFF868F96);

const List<Color> aRelax = [aRelax1, aRelax2];
const List<Color> aSleep = [aSleep1, aSleep2];
const List<Color> aInspire = [aInspire1, aInspire2];
const List<Color> aStress = [aStress1, aStress2];
const List<Color> aFocus = [aFocus1, aFocus2];

const List<List<Color>> gradients = [aRelax, aSleep, aInspire, aStress, aFocus];

const double aBorderWidth = 1.0;
const double aBorderRadius = 10.0;
const double aPadding = 15.0;
const double aLargerPadding = 30.0;
const double aStandardWidth = 380.0;

List<Shadow> aTextShadow = [
  Shadow(
    offset: Offset(0, 0),
    blurRadius: 10,
    color: Colors.black.withAlpha(40),
  ),
];

final aFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0,);