import 'package:anya/presentation/config/app_localization.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:flutter/material.dart';

/// Show snackbar
void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, String value, [Color color]) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      content: Text(value),
      backgroundColor: color ?? Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 1500),
    ),
  );
}

// Show network problem dialog
Future<bool> showNoNetworkDialog(BuildContext context, String message) async {
  dynamic result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              height: 180,
              width: 290,
              padding: EdgeInsets.all(aPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('offline_title'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: aPadding),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: aPadding),
                  FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context, {'reload': true});
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('offline_reload'),
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  return result['reload'];
}

void unfocus(BuildContext context, {Function callback}) async {
  FocusScope.of(context).unfocus();
  callback != null ? callback() : {};
//  await SystemChrome.setEnabledSystemUIOverlays([]);
}