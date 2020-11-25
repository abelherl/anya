import 'package:anya/domain/entity/user.dart';
import 'package:anya/domain/entity/user_session.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalSessionRepository{
  /// Load access token from shared preferences / local DB
  Future<Either<Failure,UserSession>> load();
  /// Save access token to shared preferences / Local DB
  Future<Either<Failure,bool>> save(String accessToken, User user);
}