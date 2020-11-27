import 'dart:convert';

import 'package:anya/data/model/user_model.dart';
import 'package:anya/domain/repository/user_repository.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl extends UserRepository {
  /// Shared preferences key
  static const String userListToken = 'userList';

  BaseOptions options = new BaseOptions(
    baseUrl: "example.com",
    connectTimeout: 3000,
    receiveTimeout: 3000,
  );

  UserRepositoryImpl();

  @override
  Future<Either<Failure,bool>> getUsers() async {
    //TODO fetch user list from server
    List<UserModel> users = List();
    users.add(
      UserModel(
        email: "111111222222",
        name: "Dummy-1",
        image: "",
        password: "000000",
      ),
    );
    users.add(
      UserModel(
        email: "333333444444",
        name: "Dummy-2",
        image: "https://petapixel.com/assets/uploads/2019/02/download-3-800x800.jpeg",
        password: "111111",
      ),
    );
    users.add(
      UserModel(
        email: "555555666666",
        name: "Dummy-3",
        image: "https://petapixel.com/assets/uploads/2019/02/download-3-800x800.jpeg",
        password: "222222",
      ),
    );

    String jsonUsers = jsonEncode(users);
    print("jsonUsers : $jsonUsers");

    ///save user list to shared preferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(userListToken, jsonUsers);

    /// to do handle request failure
    return Right(true);
  }
}
