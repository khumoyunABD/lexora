part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object?> get props => [];
}

class SessionInitial extends SessionState {
  const SessionInitial();
}

class SessionLoading extends SessionState {
  const SessionLoading();
}

class SessionsLoaded extends SessionState {
  final List<Session> sessions;

  const SessionsLoaded(this.sessions);

  @override
  List<Object?> get props => [sessions];
}

class SessionDetailLoaded extends SessionState {
  final Session session;

  const SessionDetailLoaded(this.session);

  @override
  List<Object?> get props => [session];
}

class SessionError extends SessionState {
  final String message;

  const SessionError(this.message);

  @override
  List<Object?> get props => [message];
}
