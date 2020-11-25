import 'package:anya/domain/entity/user.dart';
import 'package:flutter/material.dart';

@immutable
class UserModel extends User {
  UserModel({
    @required String id,
    @required String uid,
    @required String nik,
    @required String name,
    @required String image,
    @required String pin,
    @required List<dynamic> search,
  }) : super(
          id: id,
          uid: uid,
          nik: nik,
          name: name,
          image: image,
          pin: pin,
          search: search,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nik: map['nik'],
      name: map['name'],
      image: map['image'],
      pin: map['pin'],
      search: map['search'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'nik':nik,
      'name':name,
      'image':image,
      'pin':pin,
      'search':search,
    };
  }
}
