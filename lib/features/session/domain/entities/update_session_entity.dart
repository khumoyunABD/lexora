import 'package:equatable/equatable.dart';

class UpdateSessionNameEntity extends Equatable {
  final String name;

  const UpdateSessionNameEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
