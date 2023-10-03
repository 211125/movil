import 'package:flutter/material.dart';
import 'package:flutter_application_1/postcase_config.dart';
import 'package:flutter_application_1/publication/presentations/bloc/createpost/createpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/delitepost/delitepost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getIdpost/getIdpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/getpost/getpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/bloc/putpost/putpost_bloc.dart';
import 'package:flutter_application_1/publication/presentations/pages/RecordAddress.dart';
import 'package:flutter_application_1/publication/presentations/pages/createpost_page.dart';
import 'package:flutter_application_1/publication/presentations/pages/getPost_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

UsercaseConfig usercaseConfig = UsercaseConfig();

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<CreatePostBloc>(
          create: (context) => CreatePostBloc(
              createUserUseCase: usercaseConfig.createUserUseCase
          ),
        ),
        BlocProvider<DelitePostBloc>(
          create: (context) => DelitePostBloc(
              deleteUserUseCase: usercaseConfig.deleteUserUseCase
          ),
        ),
        BlocProvider<getIdpostBloc>(
          create: (context) => getIdpostBloc(
              getUserIdUseCase: usercaseConfig.getUserIdUseCase
          ),
        ),
        BlocProvider<GetPostBloc>(
          create: (context) => GetPostBloc(
              getUsersUseCase: usercaseConfig.getUsersUseCase
          ),
        ),

        BlocProvider<PutPostBloc>(
          create: (context) => PutPostBloc(
              updateUserUseCase: usercaseConfig.updateUserUseCase
          ),
        ),

      ],
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsPage(),
    );
  }
}







