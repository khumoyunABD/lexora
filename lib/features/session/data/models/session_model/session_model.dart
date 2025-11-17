import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
class SessionModel with _$SessionModel {
  const SessionModel._();

  const factory SessionModel({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  /// Converts SessionModel to SessionEntity
  SessionEntity toEntity() {
    return SessionEntity(
      id: id,
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      durationMinutes: durationMinutes,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
