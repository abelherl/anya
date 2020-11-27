import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String image;
  final String gender;
  final int waterConsumption;
  final String theme;
  String horoscope;
  final int defaultMode;
  final String password;
  final int playingTime;

  User({
    this.id,
    this.email,
    this.name,
    this.image,
    this.gender,
    this.defaultMode,
    this.horoscope,
    this.theme,
    this.playingTime,
    this.waterConsumption,
    this.password,
  });

  @override
  List<Object> get props => [email];


}
