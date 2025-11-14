import 'package:dio/dio.dart';
import 'package:lexora/core/exceptions/exceptions.dart';

class HandleError {
  /// Converts Dio errors into custom exceptions with proper error messages
  /// Extracts error messages from API responses when available
  static Exception handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else if (error is Exception) {
      return ServerException(
        statusCode: 500,
        errorMessage: "Unexpected error occurred",
      );
    }
    return ServerException(
      statusCode: 500,
      errorMessage: "An unexpected error occurred",
    );
  }

  /// Handles DioException and extracts meaningful error messages
  static Exception _handleDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException(
          statusCode: 408,
          errorMessage: "Connection timeout. Please check your internet connection.",
        );

      case DioExceptionType.sendTimeout:
        return ServerException(
          statusCode: 408,
          errorMessage: "Request timeout. Please try again.",
        );

      case DioExceptionType.receiveTimeout:
        return ServerException(
          statusCode: 408,
          errorMessage: "Server is taking too long to respond. Please try again.",
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(dioError);

      case DioExceptionType.cancel:
        return ServerException(
          statusCode: 499,
          errorMessage: "Request was cancelled",
        );

      case DioExceptionType.badCertificate:
        return ServerException(
          statusCode: 495,
          errorMessage: "Security certificate error. Please contact support.",
        );

      case DioExceptionType.connectionError:
        return ServerException(
          statusCode: 503,
          errorMessage: "No internet connection. Please check your network.",
        );

      case DioExceptionType.unknown:
        return ServerException(
          statusCode: 500,
          errorMessage: "Something went wrong. Please try again.",
        );
    }
  }

  /// Extracts error message from API response
  static Exception _handleBadResponse(DioException dioError) {
    final statusCode = dioError.response?.statusCode ?? 500;
    String errorMessage = "Something went wrong. Please try again.";

    // Try to extract error message from response
    try {
      final responseData = dioError.response?.data;

      if (responseData != null) {
        if (responseData is Map<String, dynamic>) {
          // Try different common error message keys
          errorMessage = responseData['detail'] ??
              responseData['message'] ??
              responseData['error'] ??
              responseData['errors']?.toString() ??
              errorMessage;
        } else if (responseData is String) {
          errorMessage = responseData;
        }
      }

      // Provide user-friendly messages for common status codes
      if (errorMessage == "Something went wrong. Please try again.") {
        errorMessage = _getFriendlyMessageForStatusCode(statusCode);
      }
    } catch (e) {
      // If parsing fails, use status code message
      errorMessage = _getFriendlyMessageForStatusCode(statusCode);
    }

    return ServerException(
      statusCode: statusCode,
      errorMessage: errorMessage,
    );
  }

  /// Returns user-friendly messages for common HTTP status codes
  static String _getFriendlyMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Invalid request. Please check your input.";
      case 401:
        return "Incorrect email or password. Please try again.";
      case 403:
        return "You don't have permission to access this resource.";
      case 404:
        return "The requested resource was not found.";
      case 409:
        return "A conflict occurred. This resource may already exist.";
      case 422:
        return "Invalid data provided. Please check your input.";
      case 429:
        return "Too many requests. Please try again later.";
      case 500:
        return "Server error. Please try again later.";
      case 502:
        return "Server is temporarily unavailable. Please try again.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return "Something went wrong. Please try again.";
    }
  }
}
