import 'package:equatable/equatable.dart';

class CreateSessionEntity extends Equatable {
  final String agentType;
  final String name;

  const CreateSessionEntity({
    required this.agentType,
    required this.name,
  });

  @override
  List<Object?> get props => [
        agentType,
        name,
      ];
}
