
import '../../data/models/getuser_model.dart';
import '../../data/models/posh_model.dart';

abstract class UserRepository {
  Future<List<PostModel>> getUsers(bool conection);
  Future<PostModel> getUser(String id);
  Future<void> createUser(createModel user);
  Future<void> updateUser(PostModel user);
  Future<void> deleteUser(String id);
}