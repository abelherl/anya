import 'package:anya/data/datasource/data_dummy.dart';
import 'package:anya/domain/entity/user.dart';
import 'package:anya/presentation/bloc/session_bloc.dart';
import 'package:anya/presentation/config/route_config.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/presentation/core/constant_styling.dart';
import 'package:anya/presentation/page/listen/widget.dart';
import 'package:anya/presentation/page/types/page.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:division/division.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sailor/sailor.dart';

class ListenPage extends StatefulWidget {
  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> with TickerProviderStateMixin {
  int _selectedType = 0;
  double _y = 0;
  bool _animate = true;
  User _user = User(horoscope: 'aquarius');
  Color _bg = Colors.black;
  final _player = AssetsAudioPlayer();
  bool _isPaused = false;

  SessionBloc _sessionBloc;

  void _changeType([bool increase, int toIndex]) {
    if (increase != null) {
      setState(() {
        if (increase) {
          _selectedType =
              (_selectedType == types.length - 1) ? 0 : _selectedType + 1;
        } else {
          _selectedType =
              (_selectedType == 0) ? types.length - 1 : _selectedType - 1;
        }
        _animate = false;
      });
    }
    else {
      setState(() {
        _animate = false;
        _selectedType = toIndex;
      });
    }

    _player.playlistPlayAtIndex(_selectedType);
    if (_isPaused) {
      Future.delayed(Duration(milliseconds: 100), () {
        _player.pause();
      });
    }
  }

  void _pause() {
    print("PAUSING");
    _player.playOrPause();
    setState(() {
      _animate = false;
      _isPaused = !_player.isPlaying.value;
    });
  }

  void _play() {
    print("PLAYING");
    _player.play();
  }

  void _popUp() async {
    final result = await Navigator.push(context, CustomPageRoute(TypesPage()));
    if (result['selected'] != null) {
      _changeType(null, result['selected']);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _sessionBloc = BlocProvider.of<SessionBloc>(context);
    _sessionBloc.loadLocal();

    print("TYPES: $types");

    _player.setVolume(5);
    _player.open(
      Playlist(
        audios: types.map((e) =>
            Audio("/assets/audios/${e.toLowerCase()}.mp3",
              metas: Metas(
                title:  e,
                artist: 'Anya',
                album: 'Playlist',
                image: MetasImage.asset("assets/icons/app-icon.png"),
              ),
            ),
        ).toList(),
      ),
      notificationSettings: NotificationSettings(
        seekBarEnabled: false,
        nextEnabled: false,
        prevEnabled: false,
        stopEnabled: false,
      ),
      loopMode: LoopMode.single,
      showNotification: true,
    );

    Future.delayed(Duration(seconds: 1), () {
      _play();

      setState(() {
        _animate = false;
        _isPaused = !_player.isPlaying.value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _dark = false;
    String _formattedDate = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
    String _formattedTime = DateFormat('HH:mm').format(DateTime.now());

    Future.delayed(Duration(milliseconds: 500), () => setState(() {
      _animate = false;
      _isPaused = !_player.isPlaying.value;
    }));

    print("Y1: $_y $_animate");
    _animate ? Future.delayed(Duration(milliseconds: 2000), () => setState(() {
      _animate = true;
      _y = (_y == -20) ? 0 : -20;
    })) : null;
    print("Y2: $_y $_animate");

    return MultiBlocListener(
      listeners: [
        BlocListener(
          cubit: _sessionBloc,
          listener: _afterCheckSession,
        )
      ],
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (dragUpdateDetails) {
            if (dragUpdateDetails.primaryVelocity < -500) {
              _changeType(true);
            }
            if (dragUpdateDetails.primaryVelocity > 500) {
              _changeType(false);
            }
          },
          onVerticalDragEnd: (dragUpdateDetails) {
            if (dragUpdateDetails.primaryVelocity < -500) {
              _popUp();
            }
          },
          child: Parent(
            style: ParentStyle()
              ..linearGradient(
                colors: _dark ? [_bg, _bg] : gradients[_selectedType],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
              ..animate(700, Curves.easeOutCirc),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset('assets/icons/settings.svg', color: Colors.transparent, width: 30,),
                          onTap: () {},
                        ),
                        Expanded(
                          child: Center(
                            child: Parent(
                              style: ParentStyle()
                                ..width(60)
                                ..height(60)
                                ..padding(all: 12)
                                ..linearGradient(colors: !_dark ? [Colors.white, Colors.white] : gradients[_selectedType])
                                ..borderRadius(all: 30)
                                ..boxShadow(color: gradients[_selectedType][0], spread: -3, blur: 10, offset: Offset(0, 3)),
                              child: LinearGradientMask(
                                child: SvgPicture.asset(
                                  'assets/icons/${_user.horoscope.toLowerCase()}.svg',
                                  color: Colors.white,
                                  width: 36,
                                ),
                                colors: _dark ? [Colors.white, Colors.white] : gradients[_selectedType],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: SvgPicture.asset('assets/icons/settings.svg', width: 30,),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      _formattedDate,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        shadows: aTextShadow,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _formattedTime,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: 80,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        shadows:  aTextShadow,
                      ),
                    ),
                    Spacer(),
                    LinearGradientMask(
                      child: SvgPicture.asset(
                        'assets/icons/${types[_selectedType].toLowerCase()}.svg',
                        color: Colors.white,
                        height: 180,
                      ),
                      colors: _dark ? gradients[_selectedType] : [Colors.white54, Colors.white54],
                    ),
                    Spacer(),
                    Spacer(),
                    Text(
                      types[_selectedType],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          shadows: aTextShadow,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      descriptions[_selectedType],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        shadows: aTextShadow,
                      ),
                    ),
                    Container(
                      height: 120,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: AnimatedOpacity(
                              opacity: _isPaused ? 0 : 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOutCirc,
                              child: SpinKitRipple(
                                color: _dark ? gradients[_selectedType][0] : Colors.white,
                                size: 120,
                                controller: AnimationController(vsync: this, duration: Duration(milliseconds: 3500)),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Parent(
                              gesture: Gestures()
                                ..onTap(() => _pause()),
                              style: ParentStyle()
                                ..alignment.center()
                                ..width(55)
                                ..height(55)
                                ..padding(all: 16, left: _isPaused ? 19 : null)
                                ..linearGradient(colors: !_dark ? [Colors.white, Colors.white] : gradients[_selectedType])
                                ..animate(400, Curves.easeOutCirc)
                                ..borderRadius(all: 30)
                                ..boxShadow(color: gradients[_selectedType][0], spread: -3, blur: 10, offset: Offset(0, 3)),
                              child: LinearGradientMask(
                                child: SvgPicture.asset(
                                  _isPaused ? 'assets/icons/play.svg' : 'assets/icons/pause.svg',
                                  color: Colors.white,
                                  width: 36,
                                ),
                                colors: _dark ? [Colors.white, Colors.white] : gradients[_selectedType],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      transform: Matrix4.translationValues(0, _y, 0),
                      duration: Duration(milliseconds: _animate ? 3000 : 0),
                      curve: Curves.easeInOutCirc,
                      child: SvgPicture.asset(
                        'assets/icons/arrow-up.svg',
                        color: Colors.white,
                        width: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _afterCheckSession(
      BuildContext context, SessionState state) async {
    bool isLoggedIn = false;
    print('Loading $state');

    if (state is SessionLocalLoadedState) {
      setState(() {
        _user = state.session.user;
        _animate = false;
        print('CHECKED SESSION ${_user.name}');
        print('user2: ${state.session.user.name}');
        // _userBloc.getUsers(_user.nik);
      });

    }
  }
}

