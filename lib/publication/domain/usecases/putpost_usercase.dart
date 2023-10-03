

import '../../data/models/getuser_model.dart';
import '../repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;
  UpdateUserUseCase(this.userRepository);
  Future<void> execute(PostModel user) async {
    try {
      await userRepository.updateUser(user);
    } catch (e) {
      print('Error al actualizar el usuario: $e');
      throw e;
    }
  }
}