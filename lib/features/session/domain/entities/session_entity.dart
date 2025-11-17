import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String startTime;
  final String? endTime;
  final int? durationMinutes;
  final String status;
  final String createdAt;
  final String? updatedAt;

  const SessionEntity({
    required this.id,
    required this.title,
    this.description,
    required this.startTime,
    this.endTime,
    this.durationMinutes,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        startTime,
        endTime,
        durationMinutes,
        status,
        createdAt,
        updatedAt,
      ];
}
