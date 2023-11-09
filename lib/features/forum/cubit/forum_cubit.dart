import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:estate_community_app/repositories/forum_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forum_state.dart';
part 'forum_cubit.freezed.dart';

@injectable
class ForumCubit extends Cubit<ForumState> {
  ForumCubit({required this.forumRepository})
      : super(const ForumState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;
  final ForumRepository forumRepository;

  Future<void> start() async {
    emit(
      const ForumState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = forumRepository.getItemsStream().listen((data) {
      emit(
        ForumState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ForumState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> deleteDocument({required String id}) async {
    await FirebaseFirestore.instance.collection('forum').doc(id).delete();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
