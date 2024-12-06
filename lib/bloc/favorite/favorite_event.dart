import 'package:equatable/equatable.dart';
import 'package:bloc_taj/model/model_item.dart';

abstract class FavoriteEvent extends Equatable{
  const FavoriteEvent();
  @override
  List<Object?> get props => [];
}

class EventFavoriteList extends FavoriteEvent{}

class EventFavorite extends FavoriteEvent{
  final FavoriteModel item;
   const EventFavorite({required this.item });

}

class SelectItem extends FavoriteEvent{
  final FavoriteModel item;
  const SelectItem({required this.item });

}

class UnSelectItem extends FavoriteEvent{
  final FavoriteModel item;
  const UnSelectItem({required this.item });

}

class DeleteCheckItem extends FavoriteEvent{}