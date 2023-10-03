import 'dart:convert';

import '../models/getuser_model.dart';
import '../models/posh_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource2 {
  Future<List<PostModel>> getUsers(bool conection);
  Future<PostModel> getUser(String id);
  Future<void> createUser(createModel user);
  Future<void> updateUser(PostModel user);
  Future<void> deleteUser(String id);
}

class Shared_data_sourceImp implements UserLocalDataSource2 {

@override
Future<List<PostModel>> getUsers(bool conection) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String postsString = sharedPreferences.getString('posts') ?? "[]";

    print("Recuperado de SharedPreferences: $postsString");

    List<dynamic> decodedList = jsonDecode(postsString);
    List<PostModel> posts = decodedList.map<PostModel>((post) => PostModel.fromJson(post)).toList();

    return posts;
}






  @override
  Future<PostModel> getUser(String id) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('users') ?? "[]";
    List<PostModel> users = jsonDecode(usersString).map<PostModel>((data) => PostModel.fromJson(data)).toList();

    return users.firstWhere((user) => user.id == id);
  }

  @override
  Future<void> createUser(createModel user) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('users') ?? "[]";
    List<PostModel> users = jsonDecode(usersString).map<PostModel>((data) => PostModel.fromJson(data)).toList();

    users.add(createModel(title: user.title, post: user.post) as PostModel);
    sharedPreferences.setString('users', jsonEncode(users));
  }

  @override
  Future<void> updateUser(PostModel user) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('users') ?? "[]";
    List<PostModel> users = jsonDecode(usersString).map<PostModel>((data) => PostModel.fromJson(data)).toList();

    users.removeWhere((item) => item.id == user.id);
    users.add(user);
    sharedPreferences.setString('users', jsonEncode(users));
  }

  @override
  Future<void> deleteUser(String id) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String usersString = sharedPreferences.getString('users') ?? "[]";
    List<PostModel> users = jsonDecode(usersString).map<PostModel>((data) => PostModel.fromJson(data)).toList();

    users.removeWhere((item) => item.id == id);
    sharedPreferences.setString('users', jsonEncode(users));
  }
}
