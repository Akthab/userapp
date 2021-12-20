import 'package:flutter/material.dart';
import 'package:userapp/app_enums.dart';
import 'package:userapp/bloc/login/login_block.dart/login_block.dart';
import 'package:userapp/model/request/login_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:userapp/navigation/constants/navigation_route_constant.dart';
import 'package:userapp/services/dependency_injection.dart';
import 'package:userapp/views/counter.dart';
import 'package:userapp/widgets/outlined_input_field.dart';
import '../base_view.dart';

class EditPage extends BaseView {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends BaseViewState<EditPage> {
  final LoginBloc _bloc = injection<LoginBloc>();
  final myController = TextEditingController();
  String password = "";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Counter(),
          ),
        ],
        builder: (context, child) {
          var counter = Provider.of<Counter>(context).getCounter;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Flutter TextField Example'),
            ),
            backgroundColor: counter,
            body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    OutlinedInputField(
                      hintText: 'Enter the password here',
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      isPassword: true,
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    BlocProvider(
                        create: (BuildContext context) => _bloc,
                        child: BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginError) {
                              showCustomToast(
                                  context,
                                  'Please enter a valid password',
                                  SnackBarType.error);
                            }
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (BuildContext context, LoginState state) {
                              return ElevatedButton(
                                onPressed: () {
                                  _bloc.add(AuthenticateEvent(
                                      loginRequestModel: LoginRequestModel(
                                          password: password)));
                                },
                                child: const Text('Login'),
                              );
                            },
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, NavigationRouteConstant.counter);
                        },
                        child: const Text('Article Page'))
                  ],
                )),
          );
        });
  }

  @override
  Widget buildView(BuildContext context, Size size) {
    // TODO: implement buildView
    throw UnimplementedError();
  }
}
