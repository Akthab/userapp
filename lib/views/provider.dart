import 'package:flutter/material.dart';

class ColorChange extends ChangeNotifier {
  var _count = 0;
  //Initially color is set to yellow which will be changed when button is pressed
  Color color = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Change Container Color"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color:
                    color, //value of color which we will change by pressing buttons
              ),

              /* Below Row of Button when pressed will fire up 
                the setState and the state of our default color variable will 
                change according to Button which is pressed
             */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: Text("Red"),
                    onPressed: () {
                      // setState(() {
                      //   color = Colors.red;
                      // });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text("Green"),
                    onPressed: () {
                      // setState(() {
                      //   color = Colors.green;
                      // });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text("Blue"),
                    onPressed: () {
                      // setState(() {
                      //   color = Colors.blue;
                      // });
                    },
                  ),
                  Text(
                    '$_count',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    _count += 1;
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}
