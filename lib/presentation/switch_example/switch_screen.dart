import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/switch/switch_bloc.dart';
import 'package:bloc_taj/bloc/switch/switch_event.dart';
import 'package:bloc_taj/bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous,current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                        activeColor: Colors.deepPurple.shade200,
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context.read<SwitchBloc>().add(
                              EnableOrDisableNotification());
                          //state.isSwitch = newValue;
                        });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),

            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous,current) => previous.slider != current.slider,
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(SliderEvents(slider: value));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
