import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_details_state.dart';
part 'forum_details_cubit.freezed.dart';

class ForumDetailsCubit extends Cubit<ForumDetailsState> {
  ForumDetailsCubit({required this.forumRepository})
      : super(const ForumDetailsState(forumModel: null, errorMessage: ''));

  final ForumRepository forumRepository;

  Future<void> getPostWithID(String id) async {
    try {
      final forumModel = await forumRepository.get(id: id);
      emit(ForumDetailsState(forumModel: forumModel, errorMessage: ''));
    } catch (e) {
      emit(ForumDetailsState(forumModel: null, errorMessage: e.toString()));
    }
  }
}
