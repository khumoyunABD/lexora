import 'package:equatable/equatable.dart';

/// User entity representing a user in the domain layer
class UserEntity extends Equatable {
  final int id;
  final String email;
  final bool isActive;
  final String createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.isActive,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, email, isActive, createdAt];
}
