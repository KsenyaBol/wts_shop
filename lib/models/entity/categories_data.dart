import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_data.g.dart';

@JsonSerializable()
class CategoriesData {

  final String title;
  final String imageUrl;
  final int categoryId;

  CategoriesData({
    required this.title,
    required this.imageUrl,
    required this.categoryId
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) => _$CategoriesDataFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);

}