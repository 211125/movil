import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/getuser_model.dart';

import 'package:http/http.dart' as http;

import '../models/posh_model.dart';



abstract class UserLocalDataSource {
  Future<List<PostModel>> getUsers(bool conection);
  Future<PostModel> getUser(String id);
  Future<void> createUser(createModel user);
  Future<void> updateUser(PostModel user);
  Future<void> deleteUser(String id);

}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final String _baseUrl = 'http://192.168.1.73:8080';
@override
Future<List<PostModel>> getUsers(bool conection) async {
    var response = await http.get(Uri.parse('$_baseUrl/Student/listStudent'));
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
        List<PostModel> posts=jsonDecode(response.body).map<PostModel>((post)=>PostModel.fromJson(post)).toList();

        // Antes de guardar
        print("Guardando en SharedPreferences: ${response.body}");

        sharedPreferences.setString('posts', jsonEncode(response.body));

        return posts;
    } else {
        throw Exception('Failed to load users');
    }
}

  @override
  Future<PostModel> getUser(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$id'));
    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
  @override
  Future<void> createUser(createModel user) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/Student'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'title': user.title,
          'post': user.post,
        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }

  }
  Future<void> updateUser(PostModel user) async {
    try {
      await http.put(
        Uri.parse('$_baseUrl/Student/${user.id}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'title': user.title,
          'post': user.post,
        }),
      );
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }
  @override
  Future<void> deleteUser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$_baseUrl/Student/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
 




}