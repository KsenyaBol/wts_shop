import 'package:json_annotation/json_annotation.dart';

part 'products_data.g.dart';

@JsonSerializable()
class ProductsData {

  final String title;
  final String imageUrl;
  final int price;

  ProductsData({
    required this.title,
    required this.imageUrl,
    required this.price
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) => _$ProductsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDataToJson(this);

}