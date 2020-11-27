import 'package:anya/domain/entity/user.dart';
import 'package:anya/presentation/bloc/session_bloc.dart';
import 'package:anya/presentation/config/route_config.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/page/login/widget.dart';
import 'package:anya/presentation/page/zodiac/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ZodiacPage extends StatefulWidget {
  @override
  _ZodiacPageState createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  User _user = User();
  String _token = 'asldflaksdjf-asdflaksdjf-asldkfjalsdf';
  SessionBloc _sessionBloc;

  List<String> _zodiacs = [
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagitarius',
    'Capricorn',
    'Aquarius',
    'Pisces',
  ];

  String _selectedZodiac = 'Libra';

  @override
  void initState() {
    _sessionBloc = BlocProvider.of<SessionBloc>(context);
    _sessionBloc.loadLocal();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: _sessionBloc,
      listener: _afterCheckSession,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/app-icon.svg',
                          width: 65,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Welcome, Anya",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "For the next step, which\nis your zodiac?",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 34),
                        GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: (MediaQuery.of(context).size.width > 500) ? 4 : 3,
                            childAspectRatio: 0.75,
                          ),
                          children: _zodiacs.map((e) => ZodiacButton(
                            e,
                            (e == _selectedZodiac),
                            (chosen) => setState(() => _selectedZodiac = chosen),
                          )).toList(),
                        ),
                        SizedBox(height: 40),
                        LoginButton(
                          title: "Next",
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            _user.horoscope = _selectedZodiac;
                            _sessionBloc.save(_token, _user);
                            App.main.router.navigate(RouteName.water);
                          },
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          onPressed: () => App.main.router.navigate(RouteName.water),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            'Skip for now',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _afterCheckSession(
      BuildContext context, SessionState state) async {
    print('Loading $state');

    if (state is SessionLocalLoadedState) {
      setState(() {
        _user = state.session.user;
        _token = state.session.session.accessToken;
        print('CHECKED SESSION ${_user.name} ${_token}');
        print('user2: ${state.session.user.name}');
        // _userBloc.getUsers(_user.nik);
      });

    }
  }
}
