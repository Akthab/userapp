import 'package:flutter/material.dart';
import 'package:userapp/bloc/add/counterevent.dart';
import 'package:userapp/routes/route.dart' as route;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();
    // code for the login page layout
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Center(
        // code for the button
        child:
            ElevatedButton(child: Text("Update Item"), onPressed: () => main()),
      ),
    );
  }
}

Future<void> main() async {
  final bloc = CounterBloc();
  print(bloc.state); // 0
  bloc.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print(bloc.state); // 1
  await bloc.close();
}
