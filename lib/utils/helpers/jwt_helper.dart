import 'dart:convert';
import 'dart:developer';

/// Utility class for JWT token operations
class JwtHelper {
  /// Decodes a JWT token and returns the payload as a Map
  /// Returns null if the token is invalid
  static Map<String, dynamic>? decodeToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        log('Invalid JWT token format: expected 3 parts, got ${parts.length}');
        return null;
      }

      // Decode the payload (second part)
      final payload = parts[1];

      // Normalize base64 string (add padding if needed)
      final normalized = base64Url.normalize(payload);

      // Decode and parse JSON
      final decoded = utf8.decode(base64Url.decode(normalized));
      return json.decode(decoded) as Map<String, dynamic>;
    } catch (e) {
      log('Error decoding JWT token: $e');
      return null;
    }
  }

  /// Checks if a JWT token is expired
  /// Returns true if expired or invalid, false if still valid
  static bool isTokenExpired(String token) {
    final payload = decodeToken(token);
    if (payload == null) {
      return true;
    }

    final exp = payload['exp'];
    if (exp == null) {
      log('JWT token has no expiration claim (exp)');
      return false; // Token without expiration is considered valid
    }

    // Convert exp (seconds since epoch) to milliseconds
    final expirationTime = DateTime.fromMillisecondsSinceEpoch(
      (exp as int) * 1000,
    );

    final now = DateTime.now();
    final isExpired = now.isAfter(expirationTime);

    if (isExpired) {
      log('JWT token expired at $expirationTime (now: $now)');
    }

    return isExpired;
  }

  /// Checks if a JWT token will expire within the given duration
  /// Useful for proactive token refresh
  static bool isTokenExpiringSoon(String token, Duration threshold) {
    final payload = decodeToken(token);
    if (payload == null) {
      return true;
    }

    final exp = payload['exp'];
    if (exp == null) {
      return false;
    }

    final expirationTime = DateTime.fromMillisecondsSinceEpoch(
      (exp as int) * 1000,
    );

    final now = DateTime.now();
    final timeUntilExpiration = expirationTime.difference(now);

    return timeUntilExpiration <= threshold;
  }

  /// Gets the expiration time of a JWT token
  /// Returns null if token is invalid or has no expiration
  static DateTime? getExpirationTime(String token) {
    final payload = decodeToken(token);
    if (payload == null) {
      return null;
    }

    final exp = payload['exp'];
    if (exp == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch((exp as int) * 1000);
  }

  /// Gets the issued-at time of a JWT token
  /// Returns null if token is invalid or has no iat claim
  static DateTime? getIssuedAtTime(String token) {
    final payload = decodeToken(token);
    if (payload == null) {
      return null;
    }

    final iat = payload['iat'];
    if (iat == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch((iat as int) * 1000);
  }

  /// Gets the subject (user ID) from a JWT token
  /// Returns null if token is invalid or has no sub claim
  static String? getSubject(String token) {
    final payload = decodeToken(token);
    if (payload == null) {
      return null;
    }

    return payload['sub'] as String?;
  }
}
