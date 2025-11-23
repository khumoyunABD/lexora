import 'package:equatable/equatable.dart';

class UpdateSessionEntity extends Equatable {
  final String? title;
  final String? description;
  final String? status;

  const UpdateSessionEntity({
    this.title,
    this.description,
    this.status,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        status,
      ];
}
