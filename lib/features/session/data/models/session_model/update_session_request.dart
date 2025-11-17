import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_session_request.freezed.dart';
part 'update_session_request.g.dart';

@freezed
class UpdateSessionRequest with _$UpdateSessionRequest {
  const factory UpdateSessionRequest({
    String? title,
    String? description,
    String? status,
  }) = _UpdateSessionRequest;

  factory UpdateSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSessionRequestFromJson(json);
}
