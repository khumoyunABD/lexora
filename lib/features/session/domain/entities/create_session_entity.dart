import 'package:equatable/equatable.dart';

class CreateSessionEntity extends Equatable {
  final String title;
  final String? description;

  const CreateSessionEntity({
    required this.title,
    this.description,
  });

  @override
  List<Object?> get props => [
        title,
        description,
      ];
}
