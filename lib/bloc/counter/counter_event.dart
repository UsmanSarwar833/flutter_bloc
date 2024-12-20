

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{

  const CounterEvent();

  @override
  List<Object> get pros => [];
}


class IncrementCounter extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class DecrementCounter extends CounterEvent{
  @override
  List<Object?> get props => [];
}