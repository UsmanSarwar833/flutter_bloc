import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/todo/todo_bloc.dart';
import 'package:bloc_taj/bloc/todo/todo_event.dart';
import 'package:bloc_taj/bloc/todo/todo_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state.todoList.isEmpty){
            return const Center(child: Text("No Todo's found"));
          }else{
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(state.todoList[index].toString()),
                    trailing: GestureDetector(
                        onTap: (){
                          context.read<TodoBloc>().add(RemoveEvent(task: state.todoList[index]));

                        },
                        child: const Icon(Icons.delete)),
                  );
                });
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          for(int i = 1; i<=10; i++){
            context.read<TodoBloc>().add(AddEvent(task: i.toString()));

          };

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
