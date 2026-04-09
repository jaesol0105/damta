import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_entity.freezed.dart';

@freezed
abstract class MemoEntity with _$MemoEntity {
  const factory MemoEntity({required String content}) = _MemoEntity;
}
