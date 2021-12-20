import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/navigation/constants/navigation_route_constant.dart';
import 'package:userapp/navigation/routes/navigation_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  List<String> list = <String>[];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // final AddTodoListBloc _bloc = injection<AddTodoListBloc>();

  final addController = TextEditingController();
  final editController = TextEditingController();

  bool _isShown = true;

  _displayAddDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Enter name'),
            content: TextField(
              controller: addController,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(hintText: "name"),
            ),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    addItem(addController.text);
                    addController.clear();
                    Navigator.pop(ctx);
                  },
                  child: Text('Add')),
              FloatingActionButton(
                  onPressed: () {
                    addController.clear();
                    // Navigator.pop(ctx);
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  _displayEditDialog(BuildContext context, int indexOfItem) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Enter the new name'),
            content: TextField(
              controller: editController,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(hintText: "name"),
            ),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    editItem(indexOfItem, editController.text);
                    editController.clear();
                    Navigator.pop(ctx);
                  },
                  child: Text('Update')),
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    // editController.clear();
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  void _deleteConfirmBox(BuildContext context, String item) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to remove the item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    removeItem(item);
                    Navigator.pop(ctx);
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Retrieve Text Input'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                          title: Text(list[index]),
                          trailing: Container(
                            width: 150,
                            child: Row(children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                tooltip: 'Edit list',
                                // onPressed: () => Navigator.pushNamed(
                                //     context, route.homePage)
                                onPressed: () {
                                  _displayEditDialog(context, index);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                tooltip: 'Delete item',
                                onPressed: () {
                                  _deleteConfirmBox(context, list[index]);
                                  // removeItem(list[index]);
                                },
                              )
                            ]),
                          )));
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _displayAddDialog(context);
          },
          tooltip: 'Show me the value!',
          child: const Icon(Icons.add),
        ),
      ),
      onGenerateRoute: generateRoute,
      initialRoute: NavigationRouteConstant.counter,
      navigatorKey: navigatorKey,
    );
  }

  void saveData(List<String> newList) async {
    SharedPreferences prefs = await _prefs;
    List<String> stringList = newList;
    print(stringList);
    prefs.setStringList('list', stringList);
  }

  getValue() async {
    SharedPreferences prefs = await _prefs;
    String? stringValue = prefs.getString('string');
    return stringValue;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await _prefs;
    List<String>? listString = prefs.getStringList('list');
    print(listString);
    if (listString != null) {
      list = listString;
      setState(() {});
    }
  }

  void editItem(int indexOfItem, String newItem) {
    list[indexOfItem] = newItem;
    saveData(list);
    loadData();
  }

  void addItem(String item) async {
    list.insert(0, item);
    saveData(list);
    loadData();
  }

  void removeItem(String item) {
    list.remove(item);
    saveData(list);
    loadData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addController.dispose();
    editController.dispose();
    super.dispose();
  }
}
