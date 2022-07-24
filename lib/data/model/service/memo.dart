import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';

part 'memo.g.dart';

@freezed
abstract class Memo with _$Memo {
  const factory Memo(String value) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
