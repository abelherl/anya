import 'dart:io';

import 'package:anya/domain/entity/user.dart';
import 'package:anya/presentation/core/app.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, List<User>>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  BaseOptions options = new BaseOptions(
    baseUrl: "example.com",
    connectTimeout: 15000,
    receiveTimeout: 15000,
  );

  @override
  Future<Either<Failure, List<User>>> getUsers([String nik]) => getUsersFrom('Users ', nik);

  Future<Either<Failure, List<User>>> getUsersFrom(String url, [String nik]) async {
    final Dio client = new Dio(options);
    client.options.headers[HttpHeaders.authorizationHeader] = "Bearer 0}";
    final response = await client.get(url);

    if (response.statusCode == 200) {
      List<User> users = [];
      Map<String, dynamic> map = response.data;
      List<dynamic> data = map["records"];

      data.forEach((element) {
        // print('Adding: ${element["cart"]}');
        // if (nik == element["nik"]) {
        print("USER ID: ${element["id"]}");
          // users.add(
            // User(
            //   id: element["id"],
            //   uid: element["fields"]["Number"],
            //   nik: element["fields"]["NIK"] ?? "",
            //   name: element["fields"]["Name"] ?? "Unknown",
            //   image: (element["fields"]["Profile Picture"] == null) ? "https://josephmaraglinobooks.com/wp-content/uploads/2018/12/profile_1107725.png" : element["fields"]["Profile Picture"][0]["url"],
            //   pin: element["fields"]["Pin"].toString(),
            //   search: null,
            //   // search: List<String>.from(element["search"]),
            // ),
          // );
        // }
      });

      if (nik != null) {
        // users = users.where((element) => element.nik == nik).toList();
      }

      return Right(users);
    } else {
      return Left(
        RequestFailure(
          code: response.statusCode,
          message: response.statusMessage,
        ),
      );
    }
  }
}