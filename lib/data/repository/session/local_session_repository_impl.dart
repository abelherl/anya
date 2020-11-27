import 'dart:convert';

import 'package:anya/data/model/combined/user_session_model.dart';
import 'package:anya/data/model/user_model.dart';
import 'package:anya/domain/entity/session.dart';
import 'package:anya/domain/entity/user.dart';
import 'package:anya/domain/entity/user_session.dart';
import 'package:anya/domain/repository/session/local_session_repository.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSessionRepositoryImpl extends LocalSessionRepository {
  /// Shared preferences key
  static const String accessTokenKey = 'accessToken';
  static const String userKey = "user";
  static const String searchHistory = "searchHistory";
  static const String localCart = "localCart";

  /// Load data from local db/shared preferences
  @override
  Future<Either<Failure, UserSession>> load() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //return empty string if accessToken not found in local db
    if (!sp.containsKey(accessTokenKey)) {
      return Right(UserSessionModel(
        session: Session(accessToken: ""),
        user: null,
      ));
    }

    String accessToken = sp.get(accessTokenKey);
    if (!sp.containsKey(userKey)) {
      return Right(
        UserSession(
          session: Session(
            accessToken: accessToken,
          ),
          user: User(
            email: "333333444444",
            name: "Dummy-1",
            image: "",
            password: "111222",
          ),
        ),
      );
    }

    print('UserModel: ${sp.get(userKey)}');

    UserModel userModel = UserModel.fromJson(json.decode(sp.get(userKey)));

    print('UserModel: ${userModel.horoscope}');
    return Right(
      UserSession(
        session: Session(
          accessToken: accessToken,
        ),
        user: userModel,
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> save(String accessToken, User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(accessTokenKey, accessToken);
    sp.setString(userKey, json.encode(UserModel(id: user.id, email: user.email, password: user.password, name: user.name, image: user.image, waterConsumption: user.waterConsumption, theme: user.theme, gender: user.gender, playingTime: user.playingTime, horoscope: user.horoscope, defaultMode: user.defaultMode,).toJson()));

    return Right(true);
  }
}
