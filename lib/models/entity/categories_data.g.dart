// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      categoryId: json['categoryId'] as int,
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
    };
