part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object?> get props => [];
}

class FetchSessionsEvent extends SessionEvent {
  const FetchSessionsEvent();
}

class GetSessionByIdEvent extends SessionEvent {
  final String sessionId;

  const GetSessionByIdEvent(this.sessionId);

  @override
  List<Object?> get props => [sessionId];
}

class ClearSelectedSessionEvent extends SessionEvent {
  const ClearSelectedSessionEvent();
}
