
import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counter;
  const CounterState({
    this.counter = 0,
  });

  CounterState copyWith({int? counter}){
   return CounterState(
       counter: counter ?? this.counter
   );
}

  @override
  List<Object?> get props => [counter];

  Map<String, dynamic> toMap() {
    return {
      'counter': this.counter,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
    );
  }
}



