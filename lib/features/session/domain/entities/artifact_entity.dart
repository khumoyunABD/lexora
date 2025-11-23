import 'package:equatable/equatable.dart';

class ArtifactsResponseEntity extends Equatable {
  final List<ArtifactEntity> artifacts;
  final int total;
  final int page;
  final int pages;

  const ArtifactsResponseEntity({
    required this.artifacts,
    required this.total,
    required this.page,
    required this.pages,
  });

  @override
  List<Object?> get props => [
        artifacts,
        total,
        page,
        pages,
      ];
}

class ArtifactEntity extends Equatable {
  final int id;
  final String sessionId;
  final String name;
  final String content;
  final String artifactType;
  final int version;
  final int wordCount;
  final Map<String, dynamic>? extraData;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ArtifactEntity({
    required this.id,
    required this.sessionId,
    required this.name,
    required this.content,
    required this.artifactType,
    required this.version,
    required this.wordCount,
    this.extraData,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        sessionId,
        name,
        content,
        artifactType,
        version,
        wordCount,
        extraData,
        createdAt,
        updatedAt,
      ];

  T? getExtraData<T>(String key) {
    return extraData?[key] as T?;
  }

  bool get isUpdated => updatedAt.isAfter(createdAt);
}
