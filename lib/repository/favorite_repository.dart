import 'package:bloc_taj/model/model_item.dart';

class FavoriteRepository{

  Future<List<FavoriteModel>> fetchItem()async{
    await Future.delayed(const Duration(seconds: 1));
    return List.of(_generateList(10));

  }

  List<FavoriteModel> _generateList(int length,){
    return List.generate(length, (index) => FavoriteModel(id: index.toString(), value: "Item ${index.toString()}"));
  }


}