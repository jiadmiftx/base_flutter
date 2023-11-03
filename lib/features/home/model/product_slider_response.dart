// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_slider_response.freezed.dart';
part 'product_slider_response.g.dart';

@freezed
class ProductSliderResponse with _$ProductSliderResponse {
  factory ProductSliderResponse({
    @JsonKey(name: 'main_title') String? mainTitle,
    @JsonKey(name: 'sub_title') dynamic subTitle,
    dynamic details,
    String? image,
    List<Product>? products,
  }) = _ProductSliderResponse;

  factory ProductSliderResponse.fromJson(Map<String, dynamic> json) => _$ProductSliderResponseFromJson(json);
}

@freezed
class Product with _$Product {
  factory Product({
    @JsonKey(name: 'product_id') String? productId,
    String? sku,
    String? name,
    String? imagePath,
    dynamic price,
    String? currency,
    @JsonKey(name: 'special_price') dynamic specialPrice,
    String? discount,
    @JsonKey(name: 'kc_cashback') String? kcCashback,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
