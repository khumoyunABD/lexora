import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/user/domain/usecases/get_user_info_usecase.dart';
import 'package:lexora/features/user/presentation/bloc/user_event.dart';
import 'package:lexora/features/user/presentation/bloc/user_state.dart';

/// BLoC for managing user state
/// Handles fetching user information
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserInfoUseCase getUserInfoUseCase;

  UserBloc({
    required this.getUserInfoUseCase,
  }) : super(const UserState.initial()) {
    on<FetchUserInfoEvent>(_onFetchUserInfo);
  }

  /// Handles fetch user info event
  Future<void> _onFetchUserInfo(
    FetchUserInfoEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());

    final result = await getUserInfoUseCase(const NoParams());

    result.fold(
      (failure) {
        log('Fetching user info failed: ${failure.errorMessage}');
        emit(UserState.error(failure: failure));
      },
      (user) {
        log('User info fetched successfully');
        emit(UserState.loaded(user: user));
      },
    );
  }
}
