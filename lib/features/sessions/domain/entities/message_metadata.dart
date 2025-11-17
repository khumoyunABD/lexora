import 'package:equatable/equatable.dart';

class MessageMetadata extends Equatable {
  final List<String> sourcesUsed;
  final double confidence;
  final int processingTime;

  const MessageMetadata({
    required this.sourcesUsed,
    required this.confidence,
    required this.processingTime,
  });

  @override
  List<Object?> get props => [sourcesUsed, confidence, processingTime];
}
