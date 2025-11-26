import 'dart:async';
import 'dart:developer';

import 'package:lexora/features/session/data/datasources/session_datasource.dart';
import 'package:lexora/features/session/data/models/message_model/message_model.dart';

class MessagePollingService {
  final SessionDatasource _datasource;
  Timer? _pollingTimer;
  StreamController<MessageResponse>? _messageController;

  MessagePollingService(this._datasource);

  /// Start polling for messages
  /// [sessionId] - The session to poll messages for
  /// [interval] - How often to poll (default: 5 seconds)
  Stream<MessageResponse> startPolling(
    String sessionId, {
    Duration interval = const Duration(seconds: 5),
  }) {
    // Cancel any existing polling
    stopPolling();

    _messageController = StreamController<MessageResponse>.broadcast();

    // Fetch immediately on start
    _fetchMessages(sessionId);

    // Then poll at intervals
    _pollingTimer = Timer.periodic(interval, (_) {
      _fetchMessages(sessionId);
    });

    return _messageController!.stream;
  }

  Future<void> _fetchMessages(String sessionId) async {
    try {
      final messages = await _datasource.getMessages(sessionId);

      if (_messageController != null && !_messageController!.isClosed) {
        _messageController!.add(messages);
        log('Polled messages for session: $sessionId');
      }
    } catch (e) {
      log('Error polling messages: $e');
      // Don't add error to stream, just log it
      // The UI will continue showing the last known state
    }
  }

  /// Stop polling
  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _messageController?.close();
    _messageController = null;
  }

  /// Check if currently polling
  bool get isPolling => _pollingTimer?.isActive ?? false;
}
