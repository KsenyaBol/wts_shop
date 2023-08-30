// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
    };
