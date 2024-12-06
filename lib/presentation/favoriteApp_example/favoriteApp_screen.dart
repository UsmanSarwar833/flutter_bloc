import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_taj/bloc/favorite/favorite_event.dart';
import 'package:bloc_taj/bloc/favorite/favorite_state.dart';
import 'package:bloc_taj/model/model_item.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(EventFavoriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.tempCheckList.isNotEmpty ? true: false,
                  child: GestureDetector(
                      onTap: (){
                        context.read<FavoriteBloc>().add(DeleteCheckItem());
                      },
                      child:const Icon(Icons.delete, color: Colors.red, size: 20,),

                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(child: Text("SomeThing went wrong"),);
            case ListStatus.success:
              return Expanded(
                child: ListView.builder(
                    itemCount: state.favoriteModel.length,
                    itemBuilder: (context, index) {
                      final item = state.favoriteModel[index];
                      return ListTile(
                        leading: Checkbox(
                          value: state.tempCheckList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context.read<FavoriteBloc>().add(SelectItem(
                                  item: item));
                            } else {
                              context.read<FavoriteBloc>().add(UnSelectItem(
                                  item: item));
                            }
                          },
                        ),
                        title: Text(item.value.toString(),
                          style: const TextStyle(color: Colors.black),),
                        trailing: GestureDetector(
                            onTap: () {
                              FavoriteModel favoriteModel = FavoriteModel(id: item
                                  .id, value: item.value, isFavorite: item
                                  .isFavorite ? false : true);
                              context.read<FavoriteBloc>().add(EventFavorite(
                                  item: favoriteModel));
                            },
                            child: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: item.isFavorite ? Colors.red : Colors.black,
                            )),
                      );
                    }),
              );
          }
        },
      ),
    );
  }
}
