import 'package:flutter_application_1/publication/data/datasources/shared_data_source.dart';
import 'package:flutter_application_1/publication/data/datasources/user_data_source.dart';

import 'package:flutter_application_1/publication/data/repositories/user_repository_impl.dart';
import 'package:flutter_application_1/publication/domain/usecases/delitepost_usercase.dart';
import 'package:flutter_application_1/publication/domain/usecases/getidpost_usercase.dart';
import 'package:flutter_application_1/publication/domain/usecases/getpost_usercase.dart.dart';
import 'package:flutter_application_1/publication/domain/usecases/poshpost_usercase.dart';
import 'package:flutter_application_1/publication/domain/usecases/putpost_usercase.dart';

class UsercaseConfig {
  UserLocalDataSourceImp? userLocalDataSourceImp;
  Shared_data_sourceImp? shared_data_sourceImp;
  UserRepositoryImpl? userRepositoryImpl;
  GetUserIdUseCase? getUserIdUseCase;
  GetUsersUseCase? getUsersUseCase;
  CreateUserUseCase? createUserUseCase;
  UpdateUserUseCase? updateUserUseCase;
  DeleteUserUseCase? deleteUserUseCase;

  UsercaseConfig() {
    userLocalDataSourceImp = UserLocalDataSourceImp();
    shared_data_sourceImp = Shared_data_sourceImp();

    userRepositoryImpl = UserRepositoryImpl(userLocalDataSource: userLocalDataSourceImp!, userLocalDataSource2: shared_data_sourceImp!);
    getUserIdUseCase = GetUserIdUseCase(userRepositoryImpl!);
    getUsersUseCase = GetUsersUseCase(userRepositoryImpl!);
    createUserUseCase = CreateUserUseCase(userRepositoryImpl!);
    updateUserUseCase = UpdateUserUseCase(userRepositoryImpl!);
    deleteUserUseCase = DeleteUserUseCase(userRepositoryImpl!);


  }
}
