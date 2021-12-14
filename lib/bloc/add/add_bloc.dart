
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userapp/bloc/add/add_state.dart';
// import 'package:userapp/bloc/add/add_event.dart';

// class AddTodoListBloc extends Bloc<AddTodoListEvent, AddTodoListState>{
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   AddTodoListBloc() : super()

//   @override
//   Stream<AddTodoListState> mapEventToState(
//     AddTodoListEvent event) async* {
//       if(event is AddItemEvent) {        
//         void saveData(List<String> newList) async {
//         SharedPreferences prefs = await _prefs;
//         List<String> stringList = newList;
//         print(stringList);
//         prefs.setStringList('list', stringList);
//       }
//       }
//     }
//   )
// }