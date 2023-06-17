import 'package:freezed_annotation/freezed_annotation.dart';

part 'programs_response.freezed.dart';
part 'programs_response.g.dart';


@freezed
class ApiModel with _$ApiModel {
  factory ApiModel({
    required String requestId,
    required List<Item> items,
    required int count,
    required String anyKey,
  }) = _ApiModel;

  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    required String createdAt,
    required String name,
    required String category,
    required int lesson,
    required String id,
    String? userName,
    String? mobileNo,
    String? emailId,
    String? city,
    String? password,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
