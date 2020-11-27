import 'package:anya/domain/entity/user.dart';
import 'package:flutter/material.dart';

@immutable
class UserModel extends User {
  UserModel({
    @required String id,
    @required String email,
    @required String password,
    @required String horoscope,
    @required int defaultMode,
    @required String theme,
    @required int playingTime,
    @required int waterConsumption,
    @required String gender,
    @required String name,
    @required String image,
  }) : super(
          id: id,
          email: email,
          name: name,
          image: image,
          password: password,
          defaultMode: defaultMode,
          theme: theme,
          playingTime: playingTime,
          waterConsumption: waterConsumption,
          gender: gender,
          horoscope: horoscope
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      image: map['image'],
      password: map['password'],
      defaultMode: map['defaultMode'],
      theme: map['theme'],
      playingTime: map['playingTime'],
      waterConsumption: map['waterConsumption'],
      gender: map['gender'],
      horoscope: map['horoscope'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email':email,
      'name':name,
      'image':image,
      'password': password,
      'defaultMode': defaultMode,
      'theme': theme,
      'playingTime': playingTime,
      'waterConsumption': waterConsumption,
      'gender': gender,
      'horoscope': horoscope,
    };
  }
}
