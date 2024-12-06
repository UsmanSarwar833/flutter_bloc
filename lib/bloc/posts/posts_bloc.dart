import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc_taj/bloc/posts/posts_event.dart';
import 'package:bloc_taj/bloc/posts/posts_state.dart';
import 'package:bloc_taj/model/posts_model.dart';
import 'package:bloc_taj/repository/post_repository.dart';
import 'package:bloc_taj/utils/enum.dart';


class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostModel> tempPostList;

  PostsBloc(this.tempPostList) : super( const PostsState()) {
    on<PostFetched>(_fetchPost);
    on<SearchItem>(_searchPost);
  }

  void _fetchPost(PostFetched event,Emitter<PostsState>emit)async{
    PostRepository postRepository = PostRepository();
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(postList: value,postStatus: PostStatus.success,message: "Api fetch successfully"));
    }).onError((error, stackTrace){
      emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
    });

  }

  void _searchPost(SearchItem event,Emitter<PostsState>emit)async{
    if(event.stString.isEmpty){
      emit(state.copyWith(tempPostList: [],searchMessage: ""));

    }else{
      tempPostList = state.postList.where((element) =>element.email.toString().toLowerCase().contains(event.stString.toString().toLowerCase() )).toList();
      tempPostList = state.postList.where((element) =>element.email.toString().toUpperCase().contains( event.stString.toString().toUpperCase())).toList();
        if(tempPostList.isEmpty){
          emit(state.copyWith(tempPostList: [],searchMessage: "No search data found"));

        }else{
          emit(state.copyWith(tempPostList: tempPostList,searchMessage: ""));

        }
    }
    //emit(state.copyWith(tempPostList: tempPostList));
  }

}
