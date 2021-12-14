part of 'login_block.dart';

abstract class LoginState {
  const LoginState();
}

// Initial Documents State
class InitialLoginState extends LoginState {
  const InitialLoginState();
}

class LoginError extends LoginState {
  final ErrorResponseModel errorResponseModel;

  const LoginError({required this.errorResponseModel});

  @override
  List<Object> get props => [errorResponseModel];
}

// Documents Downloaded
// class DocumentsDownloadedSuccess extends LoginState {
//   final CommonSuccessResponseModel commonSuccessResponseModel;

//   const DocumentsDownloadedSuccess({required this.commonSuccessResponseModel});

//   @override
//   List<Object> get props => [commonSuccessResponseModel];
// }
