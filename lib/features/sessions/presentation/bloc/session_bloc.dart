import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/session.dart';
import '../../domain/usecases/fetch_sessions_usecase.dart';
import '../../domain/usecases/get_session_by_id_usecase.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final FetchSessionsUseCase fetchSessionsUseCase;
  final GetSessionByIdUseCase getSessionByIdUseCase;

  SessionBloc({
    required this.fetchSessionsUseCase,
    required this.getSessionByIdUseCase,
  }) : super(const SessionInitial()) {
    on<FetchSessionsEvent>(_onFetchSessions);
    on<GetSessionByIdEvent>(_onGetSessionById);
    on<ClearSelectedSessionEvent>(_onClearSelectedSession);
  }

  Future<void> _onFetchSessions(
    FetchSessionsEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionLoading());
    try {
      final sessions = await fetchSessionsUseCase();
      emit(SessionsLoaded(sessions));
    } catch (e) {
      emit(SessionError(e.toString()));
    }
  }

  Future<void> _onGetSessionById(
    GetSessionByIdEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionLoading());
    try {
      final session = await getSessionByIdUseCase(event.sessionId);
      emit(SessionDetailLoaded(session));
    } catch (e) {
      emit(SessionError(e.toString()));
    }
  }

  void _onClearSelectedSession(
    ClearSelectedSessionEvent event,
    Emitter<SessionState> emit,
  ) {
    emit(const SessionInitial());
  }
}
