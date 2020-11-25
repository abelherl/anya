import 'package:equatable/equatable.dart';

class Session extends Equatable{
  final String accessToken;

  Session({
    this.accessToken,
  });

  @override
  List<Object> get props => [
    accessToken,
  ];
}