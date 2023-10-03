import 'package:bloc/bloc.dart';
import '../../../domain/usecases/getpost_usercase.dart.dart';
import 'getpost_event.dart';
import 'getpost_state.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  final GetUsersUseCase? getUsersUseCase;

  GetPostBloc({required this.getUsersUseCase}) : super(PostsInitial());

  @override
  Stream<GetPostState> mapEventToState(GetPostEvent event) async* {
    if (event is FetchPostsEvent) {
      yield PostsLoading();
      try {
        final posts = await getUsersUseCase!.execute(event.conection);

        yield PostsLoaded(posts);
      } catch (e) {
        yield PostsLoadFailure(e.toString());
      }
    }
  }
}