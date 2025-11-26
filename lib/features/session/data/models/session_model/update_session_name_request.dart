import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_session_name_request.freezed.dart';
part 'update_session_name_request.g.dart';

@freezed
class UpdateSessionNameRequest with _$UpdateSessionNameRequest {
  const factory UpdateSessionNameRequest({
    required String name,
  }) = _UpdateSessionNameRequest;

  factory UpdateSessionNameRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSessionNameRequestFromJson(json);
}
