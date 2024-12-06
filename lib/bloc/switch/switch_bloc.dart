import 'package:bloc/bloc.dart';
import 'package:bloc_taj/bloc/switch/switch_event.dart';
import 'package:bloc_taj/bloc/switch/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvents,SwitchStates>{
  SwitchBloc() : super(SwitchStates()){
   on<EnableOrDisableNotification>(_enableOrDisableNotification);
   on<SliderEvents>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwitchStates>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
}

  void _slider(SliderEvents event,Emitter<SwitchStates>emit){
    emit(state.copyWith(slider: event.slider));
  }

}


