import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';

part 'artifact_model.freezed.dart';
part 'artifact_model.g.dart';

@freezed
class ArtifactsResponse with _$ArtifactsResponse {
  const factory ArtifactsResponse({
    required List<Artifact> artifacts,
    required int total,
    required int page,
    required int pages,
  }) = _ArtifactsResponse;

  factory ArtifactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsResponseFromJson(json);
}

@freezed
class Artifact with _$Artifact {
  const factory Artifact({
    required int id,
    @JsonKey(name: 'session_id') required String sessionId,
    required String name,
    required String content,
    @JsonKey(name: 'artifact_type') required String artifactType,
    required int version,
    @JsonKey(name: 'word_count') required int wordCount,
    @JsonKey(name: 'extra_data') Map<String, dynamic>? extraData,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Artifact;

  const Artifact._();

  factory Artifact.fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);

  // Helper method to get extra data value safely
  T? getExtraData<T>(String key) {
    return extraData?[key] as T?;
  }

  // Helper method to check if artifact has been updated
  bool get isUpdated => updatedAt.isAfter(createdAt);
}

// Mapper Extensions
extension ArtifactsResponseX on ArtifactsResponse {
  ArtifactsResponseEntity toEntity() {
    return ArtifactsResponseEntity(
      artifacts: artifacts.map((a) => a.toEntity()).toList(),
      total: total,
      page: page,
      pages: pages,
    );
  }
}

extension ArtifactX on Artifact {
  ArtifactEntity toEntity() {
    return ArtifactEntity(
      id: id,
      sessionId: sessionId,
      name: name,
      content: content,
      artifactType: artifactType,
      version: version,
      wordCount: wordCount,
      extraData: extraData,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
