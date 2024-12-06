import 'package:equatable/equatable.dart';

import '../../model/model_item.dart';

enum ListStatus{loading,success,failure}

 class FavoriteState extends Equatable{
  final List<FavoriteModel> favoriteModel;
  final List<FavoriteModel> tempCheckList;
  final ListStatus listStatus;

  const FavoriteState({
   this.favoriteModel = const [],
   this.tempCheckList = const [],
   this.listStatus = ListStatus.loading,
  });


  FavoriteState copyWith({ List<FavoriteModel>? favoriteModel,List<FavoriteModel>? tempCheckList,ListStatus? listStatus,}){
   return FavoriteState(
       favoriteModel: favoriteModel ?? this.favoriteModel,
        tempCheckList: tempCheckList ?? this.tempCheckList,
       listStatus: listStatus ?? this.listStatus,

   );
}



  @override
  List<Object?> get props => [favoriteModel,tempCheckList,listStatus,];
}
