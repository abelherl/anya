import 'package:anya/domain/entity/user.dart';
import 'package:anya/domain/entity/user_session.dart';
import 'package:anya/domain/repository/session/local_session_repository.dart';
import 'package:anya/domain/repository/session/remote_session_repository.dart';
import 'package:anya/shared/clean_code/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SessionState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Initial State
class SessionInitialState extends SessionState {}

class SessionLoadingState extends SessionState {}

class SessionLoginLoadingState extends SessionState {}

class SessionLocalLoadedState extends SessionState {
  final UserSession session;

  SessionLocalLoadedState(this.session);

  @override
  List<Object> get props => [session];
}

class SessionLocalEmptyState extends SessionState {}

class SessionReadyState extends SessionState {
  final UserSession session;

  SessionReadyState(this.session);

  @override
  List<Object> get props => [session];
}

class SessionErrorState extends SessionState {
  final String message;

  SessionErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SessionLoginErrorState extends SessionState {
  final String message;

  SessionLoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SessionBloc extends Cubit<SessionState> {
  final LocalSessionRepository localSessionRepository;
  final RemoteSessionRepository remoteSessionRepository;

  SessionBloc({
    @required this.localSessionRepository,
    @required this.remoteSessionRepository,
  }) : super(SessionInitialState());

  void initialize() {
    emit(SessionInitialState());
  }

  Future<void> loadLocal() async {
    emit(SessionLoadingState());
    Either<Failure, UserSession> result = await localSessionRepository.load();
    SessionState state = result.fold(
      (failure) {
        return SessionErrorState("Failed to fetch local data");
      },
      (session) {
        if (session.session.accessToken == "") {
          return SessionLocalEmptyState();
        }
        return SessionLocalLoadedState(session);
      },
    );

    emit(state);
  }

  Future<void> save(String token, User user) async {
    emit(SessionLoadingState());
    Either<Failure, bool> result = await localSessionRepository.save(token, user);
    SessionState state = result.fold(
          (failure) {
        return SessionErrorState("Failed to fetch local data");
      },
          (_) {
        return SessionSaved();
      },
    );

    emit(state);
  }

  Future<void> login(String nik, String pin) async {
    emit(SessionLoginLoadingState());
    Either<Failure, UserSession> result = await remoteSessionRepository.create(nik, pin);

    SessionState state = result.fold(
      (failure) {
        String errorMessage = (failure as RequestFailure).data;
        return SessionLoginErrorState(errorMessage);
      },
      (session) {
        // Save to local db
        print('USER SESSION: ${session.user.name}');
        localSessionRepository.save(session.session.accessToken, session.user);
        return SessionReadyState(session);
      },
    );

    emit(state);
  }

  // Future<void> logout() async {
  //   emit(SessionLoadingState());
  //   Either<Failure, bool> result = await localSessionRepository;
  //
  //   SessionState state = result.fold(
  //         (failure) {
  //       String errorMessage = (failure as RequestFailure).data;
  //       return SessionErrorState(errorMessage);
  //     },
  //         (_) {
  //       return SessionLocalEmptyState();
  //     },
  //   );
  //
  //   emit(state);
  // }
}

class SessionSaved extends SessionState {}
