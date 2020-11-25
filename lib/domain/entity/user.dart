import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String uid;
  final String nik;
  final String name;
  final String image;
  final String pin;
  List<dynamic> search;

  User({
    this.id,
    this.uid,
    this.nik,
    this.name,
    this.image,
    this.pin,
    this.search,
  });

  @override
  List<Object> get props => [nik];


}
