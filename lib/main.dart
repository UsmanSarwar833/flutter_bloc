import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc_taj/bloc/counter/counter_bloc.dart';
import 'package:bloc_taj/bloc/favorite/favorite_bloc.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_taj/bloc/switch/switch_bloc.dart';
import 'package:bloc_taj/bloc/todo/todo_bloc.dart';
import 'package:bloc_taj/presentation/counter_example/counter_screen.dart';
import 'package:bloc_taj/presentation/favoriteApp_example/favoriteApp_screen.dart';
import 'package:bloc_taj/presentation/image_picker_example/image_picker_screen.dart';
import 'package:bloc_taj/presentation/login%20and%20signup/login/login_screen.dart';
import 'package:bloc_taj/presentation/posts_example/posts_screen.dart';
import 'package:bloc_taj/presentation/switch_example/switch_screen.dart';
import 'package:bloc_taj/presentation/todo_example/todo_screen.dart';
import 'package:bloc_taj/repository/favorite_repository.dart';
import 'package:bloc_taj/utils/imagePicker_utils.dart';

import 'bloc/posts/posts_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc([])),
        BlocProvider(create: (_) => FavoriteBloc(FavoriteRepository())),
        BlocProvider(create: (_) => PostsBloc(const [])),
      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    );
  }
}
