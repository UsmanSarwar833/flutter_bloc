
import 'package:equatable/equatable.dart';
import 'package:bloc_taj/model/posts_model.dart';
import 'package:bloc_taj/utils/enum.dart';

class PostsState extends Equatable{
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostsState({this.tempPostList = const [], this.postStatus = PostStatus.loading, this.postList = const [], this.message = "",this.searchMessage = ""});

  PostsState copyWith({ PostStatus? postStatus,List<PostModel>? postList,List<PostModel>? tempPostList,String? message,String? searchMessage}){
    return PostsState(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,
        message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,

    );
}

  @override
  List<Object?> get props => [postStatus,postList,tempPostList,message,searchMessage];


}



