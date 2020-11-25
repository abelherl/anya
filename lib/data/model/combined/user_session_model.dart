import 'package:anya/domain/entity/session.dart';
import 'package:anya/domain/entity/user.dart';
import 'package:anya/domain/entity/user_session.dart';
import 'package:flutter/cupertino.dart';

import '../session_model.dart';
import '../user_model.dart';

class UserSessionModel extends UserSession {
  UserSessionModel({
    @required Session session,
    @required User user,
  }) : super(session: session, user: user);

  factory UserSessionModel.fromJson(Map<String,dynamic> map){
    return UserSessionModel(
      session: map["session"]!=""?SessionModel.fromJson(map["session"]):null,
      user : map["user"]!=""?UserModel.fromJson(map["user"]):null,
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'session':session!=null?(session as SessionModel).toJson():"",
      'user':user!=null?(user as UserModel).toJson():"",
    };
  }
}
