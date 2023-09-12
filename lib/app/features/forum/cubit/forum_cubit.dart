import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estate_community_app/models/forum_model.dart';
import 'package:meta/meta.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  ForumCubit()
      : super(const ForumState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ForumState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('forum')
        .snapshots()
        .listen((data) {
      final forumModels = data.docs.map((doc) {
        return ForumModel(
          doc['content'],
          theme: doc['theme'],
          doc.id,
        );
      }).toList();
      emit(
        ForumState(
          documents: forumModels,
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
