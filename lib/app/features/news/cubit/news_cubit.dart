import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._newsRepository)
      : super(const NewsState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final NewsRepository _newsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _newsRepository.getItemsStream().listen((data) {
      emit(
        NewsState(
          documents: data,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          NewsState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
