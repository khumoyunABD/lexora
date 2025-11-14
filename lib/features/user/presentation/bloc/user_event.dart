import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  /// Event triggered when user info needs to be fetched
  const factory UserEvent.fetchUserInfo() = FetchUserInfoEvent;
}
