import 'package:flutter/material.dart';


class HumanClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.51, size.height * 0.57);
    path.cubicTo(size.width * 0.51, size.height * 0.59, size.width * 0.54, size.height * 0.68, size.width * 0.55, size.height * 0.72);
    path.cubicTo(size.width * 0.56, size.height * 0.73, size.width * 0.58, size.height * 0.76, size.width * 0.57, size.height * 0.78);
    path.cubicTo(size.width * 0.56, size.height * 0.8, size.width * 0.56, size.height * 0.82, size.width * 0.56, size.height * 0.84);
    path.cubicTo(size.width * 0.57, size.height * 0.85, size.width * 0.58, size.height * 0.89, size.width * 0.56, size.height * 0.91);
    path.cubicTo(size.width * 0.56, size.height * 0.92, size.width * 0.54, size.height * 0.96, size.width * 0.54, size.height * 0.96);
    path.cubicTo(size.width / 2, size.height, size.width * 0.52, size.height, size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.54, size.height, size.width * 0.56, size.height, size.width * 0.56, size.height);
    path.cubicTo(size.width * 0.57, size.height, size.width * 0.58, size.height, size.width * 0.58, size.height);
    path.cubicTo(size.width * 0.59, size.height, size.width * 0.61, size.height, size.width * 0.61, size.height);
    path.cubicTo(size.width * 0.63, size.height, size.width * 0.64, size.height, size.width * 0.64, size.height);
    path.cubicTo(size.width * 0.65, size.height, size.width * 0.65, size.height, size.width * 0.65, size.height);
    path.cubicTo(size.width * 0.68, size.height, size.width * 0.64, size.height * 0.95, size.width * 0.64, size.height * 0.95);
    path.cubicTo(size.width * 0.63, size.height * 0.92, size.width * 0.65, size.height * 0.9, size.width * 0.65, size.height * 0.9);
    path.cubicTo(size.width * 0.72, size.height * 0.81, size.width * 0.72, size.height * 0.79, size.width * 0.69, size.height * 0.76);
    path.cubicTo(size.width * 0.69, size.height * 0.75, size.width * 0.68, size.height * 0.75, size.width * 0.69, size.height * 0.74);
    path.cubicTo(size.width * 0.7, size.height * 0.73, size.width * 0.69, size.height * 0.69, size.width * 0.7, size.height * 0.68);
    path.cubicTo(size.width * 0.72, size.height * 0.65, size.width * 0.74, size.height * 0.58, size.width * 0.75, size.height * 0.54);
    path.cubicTo(size.width * 0.76, size.height / 2, size.width * 0.7, size.height * 0.43, size.width * 0.7, size.height * 0.43);
    path.cubicTo(size.width * 0.69, size.height * 0.41, size.width * 0.71, size.height * 0.32, size.width * 0.71, size.height * 0.32);
    path.cubicTo(size.width * 0.73, size.height * 0.34, size.width * 0.73, size.height * 0.37, size.width * 0.73, size.height * 0.37);
    path.cubicTo(size.width * 0.73, size.height * 0.4, size.width * 0.8, size.height * 0.45, size.width * 0.8, size.height * 0.45);
    path.cubicTo(size.width * 0.83, size.height * 0.47, size.width * 0.84, size.height * 0.49, size.width * 0.84, size.height / 2);
    path.cubicTo(size.width * 0.84, size.height / 2, size.width * 0.84, size.height * 0.52, size.width * 0.84, size.height * 0.52);
    path.cubicTo(size.width * 0.84, size.height * 0.52, size.width * 0.84, size.height * 0.53, size.width * 0.84, size.height * 0.53);
    path.cubicTo(size.width * 0.84, size.height * 0.53, size.width * 0.85, size.height * 0.54, size.width * 0.84, size.height * 0.55);
    path.cubicTo(size.width * 0.84, size.height * 0.58, size.width * 0.85, size.height * 0.58, size.width * 0.85, size.height * 0.58);
    path.cubicTo(size.width * 0.86, size.height * 0.58, size.width * 0.87, size.height * 0.55, size.width * 0.87, size.height * 0.55);
    path.cubicTo(size.width * 0.87, size.height * 0.56, size.width * 0.87, size.height * 0.58, size.width * 0.88, size.height * 0.58);
    path.cubicTo(size.width * 0.89, size.height * 0.59, size.width * 0.9, size.height * 0.58, size.width * 0.9, size.height * 0.58);
    path.cubicTo(size.width * 0.9, size.height * 0.54, size.width * 0.91, size.height * 0.55, size.width * 0.91, size.height * 0.55);
    path.cubicTo(size.width * 0.91, size.height * 0.58, size.width * 0.92, size.height * 0.59, size.width * 0.93, size.height * 0.59);
    path.cubicTo(size.width * 0.94, size.height * 0.59, size.width * 0.93, size.height * 0.55, size.width * 0.93, size.height * 0.55);
    path.cubicTo(size.width * 0.95, size.height * 0.57, size.width * 0.96, size.height * 0.57, size.width * 0.96, size.height * 0.57);
    path.cubicTo(size.width, size.height * 0.58, size.width * 0.97, size.height * 0.56, size.width * 0.97, size.height * 0.56);
    path.cubicTo(size.width * 0.95, size.height * 0.53, size.width * 0.95, size.height * 0.52, size.width * 0.95, size.height * 0.52);
    path.cubicTo(size.width * 0.97, size.height * 0.54, size.width, size.height * 0.54, size.width, size.height * 0.54);
    path.cubicTo(size.width * 1.02, size.height * 0.54, size.width * 0.97, size.height * 0.51, size.width * 0.94, size.height / 2);
    path.cubicTo(size.width * 0.93, size.height * 0.49, size.width * 0.91, size.height * 0.48, size.width * 0.91, size.height * 0.47);
    path.cubicTo(size.width * 0.9, size.height * 0.46, size.width * 0.89, size.height * 0.43, size.width * 0.89, size.height * 0.43);
    path.cubicTo(size.width * 0.89, size.height * 0.39, size.width * 0.87, size.height * 0.38, size.width * 0.87, size.height * 0.38);
    path.cubicTo(size.width * 0.83, size.height * 0.35, size.width * 0.82, size.height * 0.3, size.width * 0.82, size.height * 0.3);
    path.cubicTo(size.width * 0.82, size.height * 0.3, size.width * 0.82, size.height * 0.22, size.width * 0.82, size.height * 0.22);
    path.cubicTo(size.width * 0.81, size.height * 0.17, size.width * 0.71, size.height * 0.17, size.width * 0.71, size.height * 0.17);
    path.cubicTo(size.width * 0.61, size.height * 0.16, size.width * 0.6, size.height * 0.15, size.width * 0.6, size.height * 0.15);
    path.cubicTo(size.width * 0.58, size.height * 0.13, size.width * 0.59, size.height * 0.11, size.width * 0.59, size.height * 0.11);
    path.cubicTo(size.width * 0.61, size.height * 0.1, size.width * 0.61, size.height * 0.09, size.width * 0.61, size.height * 0.09);
    path.cubicTo(size.width * 0.64, size.height * 0.08, size.width * 0.64, size.height * 0.07, size.width * 0.63, size.height * 0.07);
    path.cubicTo(size.width * 0.62, size.height * 0.07, size.width * 0.62, size.height * 0.06, size.width * 0.62, size.height * 0.06);
    path.cubicTo(size.width * 0.64, 0, size.width * 0.51, 0, size.width * 0.51, 0);
    path.cubicTo(size.width * 0.51, 0, size.width * 0.49, 0, size.width * 0.49, 0);
    path.cubicTo(size.width * 0.49, 0, size.width * 0.36, 0, size.width * 0.38, size.height * 0.06);
    path.cubicTo(size.width * 0.38, size.height * 0.06, size.width * 0.38, size.height * 0.07, size.width * 0.37, size.height * 0.07);
    path.cubicTo(size.width * 0.36, size.height * 0.07, size.width * 0.36, size.height * 0.08, size.width * 0.39, size.height * 0.09);
    path.cubicTo(size.width * 0.39, size.height * 0.09, size.width * 0.39, size.height * 0.1, size.width * 0.41, size.height * 0.11);
    path.cubicTo(size.width * 0.41, size.height * 0.11, size.width * 0.42, size.height * 0.13, size.width * 0.4, size.height * 0.15);
    path.cubicTo(size.width * 0.4, size.height * 0.15, size.width * 0.39, size.height * 0.16, size.width * 0.29, size.height * 0.17);
    path.cubicTo(size.width * 0.29, size.height * 0.17, size.width * 0.19, size.height * 0.17, size.width * 0.18, size.height * 0.22);
    path.cubicTo(size.width * 0.18, size.height * 0.22, size.width * 0.18, size.height * 0.3, size.width * 0.18, size.height * 0.3);
    path.cubicTo(size.width * 0.18, size.height * 0.3, size.width * 0.17, size.height * 0.35, size.width * 0.13, size.height * 0.38);
    path.cubicTo(size.width * 0.13, size.height * 0.38, size.width * 0.11, size.height * 0.39, size.width * 0.11, size.height * 0.43);
    path.cubicTo(size.width * 0.11, size.height * 0.43, size.width * 0.1, size.height * 0.46, size.width * 0.09, size.height * 0.47);
    path.cubicTo(size.width * 0.09, size.height * 0.48, size.width * 0.07, size.height * 0.49, size.width * 0.06, size.height / 2);
    path.cubicTo(size.width * 0.03, size.height * 0.51, -0.02, size.height * 0.54, size.width * 0.01, size.height * 0.54);
    path.cubicTo(size.width * 0.01, size.height * 0.54, size.width * 0.03, size.height * 0.54, size.width * 0.05, size.height * 0.52);
    path.cubicTo(size.width * 0.05, size.height * 0.52, size.width * 0.05, size.height * 0.53, size.width * 0.03, size.height * 0.56);
    path.cubicTo(size.width * 0.03, size.height * 0.56, size.width * 0.01, size.height * 0.58, size.width * 0.04, size.height * 0.57);
    path.cubicTo(size.width * 0.04, size.height * 0.57, size.width * 0.05, size.height * 0.57, size.width * 0.07, size.height * 0.55);
    path.cubicTo(size.width * 0.07, size.height * 0.55, size.width * 0.06, size.height * 0.59, size.width * 0.07, size.height * 0.59);
    path.cubicTo(size.width * 0.08, size.height * 0.59, size.width * 0.09, size.height * 0.58, size.width * 0.1, size.height * 0.55);
    path.cubicTo(size.width * 0.1, size.height * 0.55, size.width * 0.1, size.height * 0.54, size.width * 0.1, size.height * 0.58);
    path.cubicTo(size.width * 0.1, size.height * 0.58, size.width * 0.11, size.height * 0.59, size.width * 0.12, size.height * 0.58);
    path.cubicTo(size.width * 0.13, size.height * 0.58, size.width * 0.13, size.height * 0.56, size.width * 0.13, size.height * 0.55);
    path.cubicTo(size.width * 0.13, size.height * 0.55, size.width * 0.14, size.height * 0.58, size.width * 0.15, size.height * 0.58);
    path.cubicTo(size.width * 0.15, size.height * 0.58, size.width * 0.16, size.height * 0.58, size.width * 0.16, size.height * 0.55);
    path.cubicTo(size.width * 0.16, size.height * 0.54, size.width * 0.16, size.height * 0.53, size.width * 0.16, size.height * 0.53);
    path.cubicTo(size.width * 0.16, size.height * 0.53, size.width * 0.16, size.height * 0.52, size.width * 0.16, size.height * 0.52);
    path.cubicTo(size.width * 0.16, size.height * 0.52, size.width * 0.16, size.height / 2, size.width * 0.16, size.height / 2);
    path.cubicTo(size.width * 0.16, size.height * 0.49, size.width * 0.17, size.height * 0.47, size.width / 5, size.height * 0.45);
    path.cubicTo(size.width / 5, size.height * 0.45, size.width * 0.27, size.height * 0.4, size.width * 0.27, size.height * 0.37);
    path.cubicTo(size.width * 0.27, size.height * 0.37, size.width * 0.27, size.height * 0.34, size.width * 0.29, size.height * 0.32);
    path.cubicTo(size.width * 0.29, size.height * 0.32, size.width * 0.31, size.height * 0.41, size.width * 0.3, size.height * 0.43);
    path.cubicTo(size.width * 0.3, size.height * 0.43, size.width * 0.24, size.height / 2, size.width / 4, size.height * 0.54);
    path.cubicTo(size.width * 0.26, size.height * 0.58, size.width * 0.28, size.height * 0.65, size.width * 0.3, size.height * 0.68);
    path.cubicTo(size.width * 0.31, size.height * 0.69, size.width * 0.31, size.height * 0.73, size.width * 0.31, size.height * 0.74);
    path.cubicTo(size.width * 0.32, size.height * 0.75, size.width * 0.32, size.height * 0.75, size.width * 0.31, size.height * 0.76);
    path.cubicTo(size.width * 0.28, size.height * 0.79, size.width * 0.28, size.height * 0.81, size.width * 0.35, size.height * 0.9);
    path.cubicTo(size.width * 0.35, size.height * 0.9, size.width * 0.37, size.height * 0.92, size.width * 0.36, size.height * 0.95);
    path.cubicTo(size.width * 0.36, size.height * 0.95, size.width * 0.32, size.height, size.width * 0.35, size.height);
    path.cubicTo(size.width * 0.35, size.height, size.width * 0.35, size.height, size.width * 0.36, size.height);
    path.cubicTo(size.width * 0.36, size.height, size.width * 0.37, size.height, size.width * 0.39, size.height);
    path.cubicTo(size.width * 0.39, size.height, size.width * 0.41, size.height, size.width * 0.42, size.height);
    path.cubicTo(size.width * 0.42, size.height, size.width * 0.43, size.height, size.width * 0.45, size.height);
    path.cubicTo(size.width * 0.45, size.height, size.width * 0.47, size.height, size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.48, size.height, size.width / 2, size.height, size.width * 0.46, size.height * 0.96);
    path.cubicTo(size.width * 0.46, size.height * 0.96, size.width * 0.45, size.height * 0.92, size.width * 0.44, size.height * 0.91);
    path.cubicTo(size.width * 0.42, size.height * 0.89, size.width * 0.43, size.height * 0.85, size.width * 0.44, size.height * 0.84);
    path.cubicTo(size.width * 0.44, size.height * 0.82, size.width * 0.44, size.height * 0.8, size.width * 0.43, size.height * 0.78);
    path.cubicTo(size.width * 0.42, size.height * 0.76, size.width * 0.44, size.height * 0.73, size.width * 0.45, size.height * 0.72);
    path.cubicTo(size.width * 0.46, size.height * 0.68, size.width * 0.49, size.height * 0.59, size.width * 0.49, size.height * 0.57);
    path.cubicTo(size.width * 0.49, size.height * 0.57, size.width / 2, size.height * 0.57, size.width / 2, size.height * 0.57);
    path.cubicTo(size.width * 0.51, size.height * 0.57, size.width * 0.51, size.height * 0.57, size.width * 0.51, size.height * 0.57);
    path.cubicTo(size.width * 0.51, size.height * 0.57, size.width * 0.51, size.height * 0.57, size.width * 0.51, size.height * 0.57);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

}