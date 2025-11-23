import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'agent_type') required String agentType,
    required String name,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

extension SessionModelX on SessionModel {
  SessionEntity toEntity() {
    return SessionEntity(
      id: id,
      userId: userId,
      agentType: agentType,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
