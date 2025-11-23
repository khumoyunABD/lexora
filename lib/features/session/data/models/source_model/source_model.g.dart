// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourcesResponseImpl _$$SourcesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SourcesResponseImpl(
      sources: (json['sources'] as List<dynamic>)
          .map((e) => SourceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$$SourcesResponseImplToJson(
        _$SourcesResponseImpl instance) =>
    <String, dynamic>{
      'sources': instance.sources,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
    };

_$SourceItemImpl _$$SourceItemImplFromJson(Map<String, dynamic> json) =>
    _$SourceItemImpl(
      id: (json['id'] as num).toInt(),
      sessionId: json['session_id'] as String,
      sourceType: $enumDecode(_$SourceTypeEnumMap, json['source_type']),
      name: json['name'] as String,
      contentPreview: json['content_preview'] as String,
      sourceUrl: json['source_url'] as String?,
      originalFilename: json['original_filename'] as String?,
      fileSize: (json['file_size'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$SourceItemImplToJson(_$SourceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'source_type': _$SourceTypeEnumMap[instance.sourceType]!,
      'name': instance.name,
      'content_preview': instance.contentPreview,
      'source_url': instance.sourceUrl,
      'original_filename': instance.originalFilename,
      'file_size': instance.fileSize,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$SourceTypeEnumMap = {
  SourceType.upload: 'UPLOAD',
  SourceType.search: 'SEARCH',
};
