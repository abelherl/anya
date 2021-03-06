import 'package:dartz/dartz.dart';
import 'package:glovory_mart/domain/entity/session.dart';
import 'package:glovory_mart/domain/entity/user_session.dart';
import 'package:glovory_mart/shared/clean_code/failure.dart';

abstract class RemoteSessionRepository{
  /// get access token from by send device id to server
  Future<Either<Failure,UserSession>> create(String nik, String pin);
  /// for now check access token existance,only on local db/shared preferences
  Future<Either<Failure,Session>> validate();
}