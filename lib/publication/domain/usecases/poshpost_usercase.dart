import '../../data/models/posh_model.dart';
import '../repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository userRepository;
  CreateUserUseCase(this.userRepository);
  Future<void> execute(createModel user) async {
    try {
      await userRepository.createUser(user);
    } catch (e, stackTrace) {
      print('Error al crear el usuario: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }

  }
}