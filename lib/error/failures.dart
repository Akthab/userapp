import 'package:equatable/equatable.dart';
import 'package:userapp/error/error_response_model.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

class ServerFailure extends Failure {
  final ErrorResponseModel errorResponseModel;

  const ServerFailure(this.errorResponseModel);
}

class ConnectionFailure extends Failure {}
