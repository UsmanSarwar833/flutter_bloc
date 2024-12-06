import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/counter/counter_bloc.dart';
import 'package:bloc_taj/bloc/counter/counter_event.dart';
import 'package:bloc_taj/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent.shade100,
        title: const Text("Counter"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            BlocBuilder<CounterBloc,CounterState>(
                builder: (context,state){
                  print(state.counter.toString());
                  return Center(
                      child: Text(
                        // state.counter <= 0
                        //     ? 0.toString()
                        //     :
                        state.counter.toString(),style: const TextStyle(fontSize: 20),));
                }),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purpleAccent.shade100)),
                    onPressed: (){
                       context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text("Increment",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purpleAccent.shade100)),

                  onPressed: (){
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text("Decrement",style: TextStyle(fontSize: 20,color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
