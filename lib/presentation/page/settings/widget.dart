import 'package:anya/presentation/core/constant_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({
    @required this.title,
    @required this.asset,
    @required this.onPressed,
  });

  final String title;
  final String asset;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    bool logout = title.toLowerCase().contains('logout');
    return Column(
      children: [
        FlatButton(
          onPressed: () => onPressed(),
          splashColor: Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(width: title.toLowerCase().contains('preferences') ? 3 : 0),
              SvgPicture.asset(
                asset,
                width: title.toLowerCase().contains('preferences') ? 18 : 24,
                color: logout ? Colors.red : Theme.of(context).primaryColor,
              ),
              SizedBox(width: title.toLowerCase().contains('preferences') ? 22 : 16),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: logout ? Colors.red : aDarkTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 16),
              SvgPicture.asset(
                'assets/icons/chevron.svg',
                color: logout ? Colors.transparent : aLightTextColor,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: aLightTextColor.withAlpha(100),
        )
      ],
    );
  }
}
