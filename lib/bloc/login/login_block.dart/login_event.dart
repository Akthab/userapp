part of 'login_block.dart';

abstract class LoginEvent {
  const LoginEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

class AuthenticateEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;

  AuthenticateEvent({required this.loginRequestModel})
      : super([loginRequestModel]);
}
