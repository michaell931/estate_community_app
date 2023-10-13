import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_model.freezed.dart';

@freezed
class ForumModel with _$ForumModel {
  factory ForumModel({
    required final String theme,
    required final String content,
    required final String id,
  }) = _ForumModel;
}
