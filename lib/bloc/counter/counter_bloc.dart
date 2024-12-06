
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc_taj/bloc/counter/counter_event.dart';
import 'package:bloc_taj/bloc/counter/counter_state.dart';


class CounterBloc extends HydratedBloc<CounterEvent,CounterState>{
  CounterBloc() : super(const CounterState()){
     on<IncrementCounter>(_increment);
     on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit){
   emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState>emit){
    emit(state.copyWith(counter: state.counter -1));
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }





}