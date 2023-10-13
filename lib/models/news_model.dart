// class NewsModel {
//   NewsModel(
//       {required this.content,
//       required this.id,
//       required this.title,
//       required this.imageUrl});

//   final String content;
//   final String id;
//   final String title;
//   final String imageUrl;
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    required final String content,
    required final String id,
    required final String title,
    required final String imageUrl,
  }) = _NewsModel;
}
