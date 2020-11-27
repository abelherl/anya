import 'package:anya/data/datasource/user_remote_data_source.dart';
import 'package:anya/domain/entity/session.dart';
import 'package:anya/domain/entity/user.dart';
import 'package:anya/domain/entity/user_session.dart';
import 'package:anya/domain/repository/session/remote_session_repository.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';

class RemoteSessionRepositoryImpl extends RemoteSessionRepository {
  //Shared preferences key
  static const String accessTokenKey = "accessToken";
  static const String deviceKey = "deviceKey";

  RemoteSessionRepositoryImpl();

  /// Send create session request by submitting device id
  @override
  Future<Either<Failure, UserSession>> create(
    String email,
    String password,
  ) async {
    //Create dummy data
    String dummyToken = "asldflaksdjf-asdflaksdjf-asldkfjalsdf";

    final result = await UserRemoteDataSourceImpl().getUsers();
    List<User> _users = [];
    User _user;
    String _wrong = 'email';

    result.fold(
      (failure) {},
      (users) {
        print('Finding: ${users.length}!');
        _users = users;
      },
    );

    if (_users.length == 0) {
      Left(
        RequestFailure(
          code: 201,
          message: "Server error",
          data: "Mission failed, we get them next time",
        ),
      );
    }
    else {
      _users.forEach((element) {
        if (email == element.email) {
          if (password == element.password) {
            _user = element;
          } else {
            _wrong = 'pin';
          }
        }
      });

      return (_user != null) ? Right(
        UserSession(
          session: Session(
            accessToken: dummyToken,
          ),
          user: _user,
        ),
      ) : Left(
        RequestFailure(
          code: 201,
          message: "Incorrect $_wrong",
          data: "Your ${(_wrong == "nik") ? "NIK is not registered" : "PIN is incorrect"}",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Session>> validate() {
    // TODO: implement validate
  }
}
