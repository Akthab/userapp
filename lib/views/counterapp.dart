import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/navigation/constants/navigation_route_constant.dart';
import 'package:userapp/views/counter.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "New Color Generator"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({required this.title});

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: counter,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color:
                    counter, //value of color which we will change by pressing buttons
              ),
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () => _incrementCounter(context),
            tooltip: 'Increment',
            backgroundColor: counter,
            child: Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              child: const Icon(Icons.star),
              onPressed: () {
                Navigator.pushNamed(context, NavigationRouteConstant.edit);
              })
        ])
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _incrementCounter(context),
        //   tooltip: 'Increment',
        //   backgroundColor: counter,
        //   child: Icon(Icons.add),
        // ),
        );
  }
}
