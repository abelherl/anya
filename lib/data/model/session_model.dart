import 'package:anya/domain/entity/session.dart';
import 'package:flutter/material.dart';

class SessionModel extends Session {
  SessionModel({
    @required String accessToken,
  }) : super();

  factory SessionModel.fromJson(Map<String,dynamic> json){
    return SessionModel(
      accessToken: json['access_token'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'access_token':accessToken,
    };
  }
}
