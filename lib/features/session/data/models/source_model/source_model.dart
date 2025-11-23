import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';

part 'source_model.freezed.dart';
part 'source_model.g.dart';

@freezed
class SourcesResponse with _$SourcesResponse {
  const factory SourcesResponse({
    required List<SourceItem> sources,
    required int total,
    required int page,
    required int pages,
  }) = _SourcesResponse;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);
}

@freezed
class SourceItem with _$SourceItem {
  const factory SourceItem({
    required int id,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'source_type') required SourceType sourceType,
    required String name,
    @JsonKey(name: 'content_preview') required String contentPreview,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @JsonKey(name: 'original_filename') String? originalFilename,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SourceItem;

  factory SourceItem.fromJson(Map<String, dynamic> json) =>
      _$SourceItemFromJson(json);
}

enum SourceType {
  @JsonValue('UPLOAD')
  upload,
  @JsonValue('SEARCH')
  search,
}

// Mapper Extensions
extension SourcesResponseX on SourcesResponse {
  SourcesResponseEntity toEntity() {
    return SourcesResponseEntity(
      sources: sources.map((s) => s.toEntity()).toList(),
      total: total,
      page: page,
      pages: pages,
    );
  }
}

extension SourceItemX on SourceItem {
  SourceItemEntity toEntity() {
    return SourceItemEntity(
      id: id,
      sessionId: sessionId,
      sourceType: sourceType.name.toUpperCase(),
      name: name,
      contentPreview: contentPreview,
      sourceUrl: sourceUrl,
      originalFilename: originalFilename,
      fileSize: fileSize,
      createdAt: createdAt,
    );
  }
}
