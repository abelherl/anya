import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
//  Future<Either<Failure, User>> login(String nik, );
  Future<Either<Failure, bool>> getUsers();
}