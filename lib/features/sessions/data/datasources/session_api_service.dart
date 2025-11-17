import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/session_model.dart';

abstract class SessionApiService {
  Future<List<SessionModel>> fetchSessions();
  Future<SessionModel> getSessionById(String sessionId);
}

class SessionApiServiceImpl implements SessionApiService {
  final http.Client client;
  final String baseUrl;

  SessionApiServiceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<SessionModel>> fetchSessions() async {
    final response = await client.get(
      Uri.parse('$baseUrl/sessions'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((json) => SessionModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch sessions: ${response.statusCode}');
    }
  }

  @override
  Future<SessionModel> getSessionById(String sessionId) async {
    final response = await client.get(
      Uri.parse('$baseUrl/sessions/$sessionId'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return SessionModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch session: ${response.statusCode}');
    }
  }
}
