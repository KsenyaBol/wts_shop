import 'dart:convert';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';
import 'package:wts_shop/models/entity/categories_data.dart';
import 'package:wts_shop/models/entity/products_data.dart';

class ApiClient {

  final client = HttpClient();

  Future<List<CategoriesData>> getCategoriesData() async {
    final categoriesJson = await get('${FlutterConfig.get('BASE_URL')}common/category/list?${FlutterConfig
        .get('WTS_SHOP_API_KEY')}') as List<dynamic>;
    final categoriesList = categoriesJson
        .map((dynamic e) => CategoriesData.fromJson(e as Map<String, dynamic>))
        .toList();
    return categoriesList;
  }

  Future<List<ProductsData>> getProductsData(int categoryId) async {
    final productsJson = await get('${FlutterConfig.get('BASE_URL')}common/product/list?id=$categoryId${FlutterConfig
        .get('WTS_SHOP_API_KEY')}') as List<dynamic>;
    final productsList = productsJson
        .map((dynamic e) => ProductsData.fromJson(e as Map<String, dynamic>))
        .toList();
    return productsList;
  }

  Future<dynamic> get(String requestUrl) async {
    final url = Uri.parse(requestUrl);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }

}