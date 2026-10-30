import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;

  const AppException({required this.message});
}

class RemoteException extends AppException {
  const RemoteException({required super.message});

  factory RemoteException.fromDioError(Exception e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return const RemoteException(message: 'Connection timeout');
        case DioExceptionType.receiveTimeout:
          return const RemoteException(message: 'Receive timeout');
        case DioExceptionType.sendTimeout:
          return const RemoteException(message: 'Send timeout');
        case DioExceptionType.transformTimeout:
          return const RemoteException(message: 'Transform timeout');
        case DioExceptionType.badCertificate:
          return const RemoteException(message: 'Bad certificate');
        case DioExceptionType.cancel:
          return const RemoteException(message: 'Request was canceled');
        case DioExceptionType.connectionError:
          return RemoteException(message: 'Connection error: ${e.message}');
        case DioExceptionType.unknown:
          return RemoteException(message: 'Unexpected error: ${e.message}');
        case DioExceptionType.badResponse:
          final data = e.response?.data;

          String serverMessage = '';
          if (data is Map) {
            serverMessage = (data['message'] ?? data['error'] ?? '').toString();
          } else if (data is String) {
            serverMessage = data.length > 200
                ? '${data.substring(0, 200)}...'
                : data;
          }

          final status = e.response?.statusCode;
          final msg = serverMessage.isNotEmpty
              ? 'Bad response ($status): $serverMessage'
              : 'Bad response ($status)';

          return RemoteException(message: msg);
      }
    }
    return RemoteException(message: 'Unexpected error: ${e.toString()}');
  }
}

class LocalException extends AppException {
  const LocalException({required super.message});
}