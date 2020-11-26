import 'package:anya/data/datasource/data_dummy.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TypesItem extends StatefulWidget {
  TypesItem(this.index);

  int index;

  @override
  _TypesItemState createState() => _TypesItemState();
}

class _TypesItemState extends State<TypesItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.index == 0 ? 0 : 32),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Parent(
                style: ParentStyle()
                  ..height(50)
                  ..width(50)
                  ..borderRadius(all: 8)
                  ..padding(all: 10)
                  ..linearGradient(colors: gradients[widget.index], begin: Alignment.bottomLeft, end: Alignment.topRight),
                child: SvgPicture.asset(
                  'assets/icons/${types[widget.index].toLowerCase()}.svg',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 166,
                    child: Text(
                      types[widget.index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width - 170,
                    child: Text(
                      descriptions[widget.index],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        height: 1.1,
                        fontSize: 12,
                        color: aLightTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
