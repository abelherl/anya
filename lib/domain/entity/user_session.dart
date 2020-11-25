import 'package:anya/domain/entity/session.dart';
import 'package:anya/domain/entity/user.dart';
import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  final Session session;
  final User user;

  UserSession({
    this.session,
    this.user,
  });

  @override
  List<Object> get props => [session, user];
}
