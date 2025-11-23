import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String id;
  final int userId;
  final String agentType;
  final String name;
  final String createdAt;
  final String? updatedAt;

  const SessionEntity({
    required this.id,
    required this.userId,
    required this.agentType,
    required this.name,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        agentType,
        name,
        createdAt,
        updatedAt,
      ];
}
