import 'package:anya/data/repository/session/local_session_repository_impl.dart';
import 'package:anya/data/repository/session/remote_session_repository_impl.dart';
import 'package:anya/presentation/bloc/session_bloc.dart';
import 'package:anya/presentation/config/main_theme.dart';
import 'package:anya/presentation/page/splash/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionBloc>(
          create:(BuildContext context) => SessionBloc(
            localSessionRepository: LocalSessionRepositoryImpl(),
            remoteSessionRepository: RemoteSessionRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          );
        },
        title: 'Anya',
        theme: mainTheme(),
        home: SplashPage(),
        navigatorKey: App.main.router.navigatorKey,
        onGenerateRoute: App.main.router.generator(),
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
