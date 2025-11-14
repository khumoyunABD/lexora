import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/user/domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  /// Initial state when the bloc is first created
  const factory UserState.initial() = UserInitial;

  /// State when user info is being fetched
  const factory UserState.loading() = UserLoading;

  /// State when user info is successfully loaded
  const factory UserState.loaded({
    required UserEntity user,
  }) = UserLoaded;

  /// State when fetching user info fails
  const factory UserState.error({
    required Failure failure,
  }) = UserError;
}
