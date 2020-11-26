import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:anya/presentation/page/types/widget.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class TypesPage extends StatefulWidget {
  @override
  _TypesPageState createState() => _TypesPageState();
}

class _TypesPageState extends State<TypesPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.main.router.pop(),
      onVerticalDragEnd: (dragUpdateDetails) {
        if (dragUpdateDetails.primaryVelocity > 500) {
          App.main.router.pop();
        }
        print("PAN UPDATE: ${dragUpdateDetails.primaryVelocity}");
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Parent(
          style: ParentStyle()
            ..borderRadius(all: 0)
            ..background.blur(4)
            ..background.color(Colors.black.withAlpha(50))
            ..padding(all: 25),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: Parent(
                  gesture: Gestures()..onTap(() {}),
                  style: ParentStyle()
                    ..width(400)
                    ..background.color(Theme.of(context).scaffoldBackgroundColor)
                    ..borderRadius(all: 25)
                    ..padding(all: 25)
                    ..boxShadow(color: Colors.black26, spread: 0, blur: 8, offset: Offset(0, 3)),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, index) => TypesItem(index),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Parent(
                gesture: Gestures()..onTap(() => App.main.router.pop()),
                style: ParentStyle()
                  ..width(50)
                  ..height(50)
                  ..background.color(Theme.of(context).scaffoldBackgroundColor)
                  ..padding(bottom: 3)
                  ..borderRadius(all: 25)
                  ..boxShadow(color: Colors.black26, spread: 0, blur: 8, offset: Offset(0, 3)),
                child: Center(child: Text("x", style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 24,
                ),)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
