library login_bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/error/error_response_model.dart';
import 'package:userapp/model/request/login_request_model.dart';
import '../../../common_success_response_model.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  List<String> list = <String>[];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthenticateEvent) {
      if (event.loginRequestModel.password == "" ||
          event.loginRequestModel.password == null) {
        yield LoginError(
            errorResponseModel: ErrorResponseModel(
                code: 100, message: ('Enter a valid password')));
      }
    }
  }
}
