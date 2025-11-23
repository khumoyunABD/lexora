// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtifactsResponseImpl _$$ArtifactsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtifactsResponseImpl(
      artifacts: (json['artifacts'] as List<dynamic>)
          .map((e) => Artifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$$ArtifactsResponseImplToJson(
        _$ArtifactsResponseImpl instance) =>
    <String, dynamic>{
      'artifacts': instance.artifacts,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
    };

_$ArtifactImpl _$$ArtifactImplFromJson(Map<String, dynamic> json) =>
    _$ArtifactImpl(
      id: (json['id'] as num).toInt(),
      sessionId: json['session_id'] as String,
      name: json['name'] as String,
      content: json['content'] as String,
      artifactType: json['artifact_type'] as String,
      version: (json['version'] as num).toInt(),
      wordCount: (json['word_count'] as num).toInt(),
      extraData: json['extra_data'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ArtifactImplToJson(_$ArtifactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'name': instance.name,
      'content': instance.content,
      'artifact_type': instance.artifactType,
      'version': instance.version,
      'word_count': instance.wordCount,
      'extra_data': instance.extraData,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
