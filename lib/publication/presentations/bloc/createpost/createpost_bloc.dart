import 'package:bloc/bloc.dart';
import '../../../domain/usecases/poshpost_usercase.dart';
import 'createpost_event.dart';
import 'createpost_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreateUserUseCase? createUserUseCase;

  CreatePostBloc({required this.createUserUseCase}) : super(UserInitial());

  @override
  Stream<CreatePostState> mapEventToState(CreatePostEvent event) async* {
    if (event is CreateUserEvent) {
      yield UserLoading();
      try {
        await createUserUseCase!.execute(event.user);
        yield UserCreatedSuccessfully();
      } catch (e) {
        yield UserCreationFailure(e.toString());
      }
    }
  }
}
