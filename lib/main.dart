import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/bloc/add/add_bloc.dart';
import 'package:userapp/routes/route.dart' as route;

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

  final myController = TextEditingController();

  bool _isShown = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  _displayAddDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter name'),
            content: TextField(
              controller: myController,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(hintText: "name"),
            ),
            actions: <Widget>[
              new FloatingActionButton(
                child: new Text('Add'),
                onPressed: () {
                  addItem(myController.text);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayEditDialog(BuildContext context, int indexOfItem) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter the new name'),
            content: TextField(
              controller: myController,
              textInputAction: TextInputAction.go,
              decoration: const InputDecoration(hintText: "name"),
            ),
            actions: <Widget>[
              FloatingActionButton(
                child: new Text('Update'),
                onPressed: () {
                  editItem(indexOfItem, myController.text);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _deleteConfirmBox(BuildContext context, String item) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to remove the item?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    removeItem(item);
                    // Close the dialog
                    // Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
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
                                //     context, route.loginPage)
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
      onGenerateRoute: route.controller,
      initialRoute: route.editPage,
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
}
