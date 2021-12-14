import 'package:userapp/error/error_response_model.dart';

class ServerException implements Exception {
  final ErrorResponseModel errorResponseModel;

  ServerException(this.errorResponseModel);
}

class FileExistsException implements Exception {
  final String message;

  FileExistsException(this.message);
}

class PermissionDeniedException implements Exception {
  final String message;

  PermissionDeniedException(this.message);
}
