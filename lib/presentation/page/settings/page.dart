import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/page/settings/widget.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            color: Colors.transparent,
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Parent(
                          style: ParentStyle()
                            ..width(64)
                            ..height(64)
                            ..borderRadius(all: 32)
                            ..background.color(Theme.of(context).primaryColor)
                            ..boxShadow(color: Colors.black45, spread: -5, blur: 15, offset: Offset(0, 8)),
                        ),
                        FlatButton(
                          onPressed: () => App.main.router.pop(),
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    SettingsItem(title: 'Edit Profile', asset: 'assets/icons/user.svg', onPressed: () {}),
                    SettingsItem(title: 'Change Password', asset: 'assets/icons/change password.svg', onPressed: () {}),
                    SettingsItem(title: 'Preferences', asset: 'assets/icons/preferences.svg', onPressed: () {}),
                    SettingsItem(title: 'About The App', asset: 'assets/icons/about.svg', onPressed: () {}),
                    SettingsItem(title: 'Share App', asset: 'assets/icons/share.svg', onPressed: () {}),
                    SettingsItem(title: 'Contact Us', asset: 'assets/icons/contact.svg', onPressed: () {}),
                    SettingsItem(title: 'Logout', asset: 'assets/icons/logout.svg', onPressed: () {}),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Version 1.0',
                style: Theme.of(context).textTheme.overline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
