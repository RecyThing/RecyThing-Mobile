import 'package:bloc/bloc.dart';
import '../../repositories/recyBot_repo.dart';
part 'post_recy_bot_state.dart';

class PostRecyBotCubit extends Cubit<PostRecyBotState> {
  final RecyBotRepo recyBotRepo = RecyBotRepo();

  PostRecyBotCubit() : super(PostRecyBotInitial());

  void postQuestion(String value) async {
    emit(PostRecyBotLoading());
    try {
      final answer = await recyBotRepo.postQuestion(value);
      emit(PostRecyBotSuccess(answer: answer));
    } catch (e) {
      emit(PostRecyBotFailure(msg: e.toString()));
    }
  }
}
