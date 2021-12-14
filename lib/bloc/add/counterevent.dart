import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, String> {
  CounterBloc() : super('Hello') {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 'Hello');
    });
  }
}
