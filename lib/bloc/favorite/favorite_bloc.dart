

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/favorite/favorite_event.dart';
import 'package:bloc_taj/bloc/favorite/favorite_state.dart';
import 'package:bloc_taj/model/model_item.dart';
import 'package:bloc_taj/repository/favorite_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteRepository favoriteRepository;
  List<FavoriteModel> favoriteModel = [];
  List<FavoriteModel> tempList = [];
  FavoriteBloc(this.favoriteRepository) : super(const FavoriteState()) {
     on<EventFavoriteList>(fetchList);
     on<EventFavorite>(addFavorite);
     on<SelectItem>(addCheck);
     on<UnSelectItem>(removeCheck);
     on<DeleteCheckItem>(deleteItem);
  }


  void fetchList(EventFavoriteList event, Emitter<FavoriteState>emit)async{
     favoriteModel = await favoriteRepository.fetchItem();
    emit(state.copyWith(
      favoriteModel: List.from(favoriteModel),
      listStatus: ListStatus.success,
    ));
  }

  void addFavorite(EventFavorite event, Emitter<FavoriteState>emit)async{
    final index = favoriteModel.indexWhere((element) => element.id == event.item.id);
    if(event.item.isFavorite){
      if(tempList.contains(favoriteModel[index])){
        tempList.remove(favoriteModel[index]);
        tempList.add(event.item);
      }
    }else{
      if(tempList.contains(favoriteModel[index])){
        tempList.remove(favoriteModel[index]);
        tempList.add(event.item);
      }
    }

    favoriteModel[index] = event.item;
    emit(state.copyWith(favoriteModel: List.from(favoriteModel),tempCheckList: List.from(tempList) ));
  }


  void addCheck(SelectItem event, Emitter<FavoriteState>emit)async{
    tempList.add(event.item);
    emit(state.copyWith(tempCheckList: List.from(tempList)));
  }
  void removeCheck(UnSelectItem event, Emitter<FavoriteState>emit)async{
    tempList.remove(event.item);
    emit(state.copyWith(tempCheckList: List.from(tempList)));
  }

  void deleteItem(DeleteCheckItem event, Emitter<FavoriteState>emit)async{
    for(var i=0; i<tempList.length;i++){
      favoriteModel.remove(tempList[i]);
    }
    tempList.clear();
    emit(state.copyWith(
        favoriteModel: List.from(favoriteModel),
        tempCheckList: List.from(tempList)
    )
    );
  }

}

