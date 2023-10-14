import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';

part 'forum_details_state.dart';

class ForumDetailsCubit extends Cubit<ForumDetailsState> {
  ForumDetailsCubit(this._forumRepository)
      : super(ForumDetailsState(forumModel: null));

  final ForumRepository _forumRepository;

  Future<void> getPostWithID(String id) async {
    final forumModel = await _forumRepository.get(id: id);
    emit(ForumDetailsState(forumModel: forumModel));
  }
}
