
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    String? requestId,
    List<ProductItem>? items,
    int? count,
    String? anyKey,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class ProductItem with _$ProductItem {
  factory ProductItem({
    String? createdAt,
    String? name,
    int? duration,
    String? category,
    bool? locked,
    String? id,
  }) = _ProductItem;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}

