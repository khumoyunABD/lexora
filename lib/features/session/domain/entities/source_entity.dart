import 'package:equatable/equatable.dart';

class SourcesResponseEntity extends Equatable {
  final List<SourceItemEntity> sources;
  final int total;
  final int page;
  final int pages;

  const SourcesResponseEntity({
    required this.sources,
    required this.total,
    required this.page,
    required this.pages,
  });

  @override
  List<Object?> get props => [
        sources,
        total,
        page,
        pages,
      ];
}

class SourceItemEntity extends Equatable {
  final int id;
  final String sessionId;
  final String sourceType;
  final String name;
  final String contentPreview;
  final String? sourceUrl;
  final String? originalFilename;
  final int? fileSize;
  final DateTime createdAt;

  const SourceItemEntity({
    required this.id,
    required this.sessionId,
    required this.sourceType,
    required this.name,
    required this.contentPreview,
    this.sourceUrl,
    this.originalFilename,
    this.fileSize,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        sessionId,
        sourceType,
        name,
        contentPreview,
        sourceUrl,
        originalFilename,
        fileSize,
        createdAt,
      ];
}
