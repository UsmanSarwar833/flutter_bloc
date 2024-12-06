import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/posts/posts_bloc.dart';
import 'package:bloc_taj/bloc/posts/posts_event.dart';
import 'package:bloc_taj/bloc/posts/posts_state.dart';
import 'package:bloc_taj/utils/enum.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PostsBloc>().add(PostFetched()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Api"),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade200,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    child: TextFormField(
                       onChanged: (filterKey){
                           context.read<PostsBloc>().add(SearchItem(filterKey));
                       },
                      decoration: InputDecoration(
                         hintText: "Search with Email",
                        hintStyle: TextStyle(fontSize: 12,color: Colors.grey.shade500),
                        contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.indigo.shade200,width: 2)

                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.indigo.shade200,width: 2),


                        ),
                        errorBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.indigo.shade200,width: 2)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                   ?   Center(child: Text(state.searchMessage.toString()))
                   : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.tempPostList.isNotEmpty ? state.tempPostList.length  : state.postList.length,
                        itemBuilder: (context, index) {
                          if(state.tempPostList.isNotEmpty){
                            final item = state.tempPostList[index];
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const Text(
                                            "Id:              ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(item.id.toString())
                                        ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        // Row(children: [
                                        //   const Text(
                                        //     "PostId:      ",
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 17),
                                        //   ),
                                        //   Text(item.postId.toString())
                                        // ]),
                                        // const SizedBox(
                                        //   height: 3,
                                        // ),
                                        Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Name:        ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .6,
                                                  child: Text(item.name.toString(),))
                                            ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(children: [
                                          const Text(
                                            "Email:         ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(item.email.toString())
                                        ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Description: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .62,
                                                  child: Text(
                                                    item.body.toString(),
                                                    textAlign: TextAlign.start,
                                                  ))
                                            ]),
                                      ],
                                    ),
                                  ),
                                )

                          );
                          }else{
                            final item = state.postList[index];
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: state.postList.isNotEmpty
                                    ? Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          const Text(
                                            "Id:              ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(item.id.toString())
                                        ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        // Row(children: [
                                        //   const Text(
                                        //     "PostId:      ",
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 17),
                                        //   ),
                                        //   Text(item.postId.toString())
                                        // ]),
                                        // const SizedBox(
                                        //   height: 3,
                                        // ),
                                        Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Name:        ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .6,
                                                  child: Text(item.name.toString(),))
                                            ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(children: [
                                          const Text(
                                            "Email:         ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(item.email.toString())
                                        ]),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Description: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .62,
                                                  child: Text(
                                                    item.body.toString(),
                                                    textAlign: TextAlign.start,
                                                  ))
                                            ]),
                                      ],
                                    ),
                                  ),
                                )
                                    : const Text("No data found"));
                          }

                        })

                  ),
                ],
              );
            case PostStatus.failure:
              return Text(state.message.toString());
          }
        },
      ),
    );
  }
}
