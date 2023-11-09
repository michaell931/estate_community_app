import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estate_community_app/models/news_model.dart';
import 'package:estate_community_app/repositories/news_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit({required this.newsRepository})
      : super(const NewsState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final NewsRepository newsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = newsRepository.getItemsStream().listen((data) {
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
