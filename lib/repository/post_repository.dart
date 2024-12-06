import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:bloc_taj/model/posts_model.dart';

class PostRepository{

  Future<List<PostModel>?> fetchPost()async{
    try{
         final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
         if(response.statusCode == 200){
           final body = json.decode(response.body) as List;
           return body.map((e){
             return PostModel(
               postId: e['postId'],
               id: e['id'],
               name: e['name'],
               email: e['email'],
               body: e['body'],
             );
           }).toList();
         }

    }on SocketException{
      throw Exception("socket exception");
    }on TimeoutException{
      throw Exception("timeout exception");

    } catch(e){
      throw Exception(e.toString());
    }
  }

}