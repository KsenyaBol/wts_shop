import 'dart:convert';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';
import 'package:wts_shop/models/entity/categories_data.dart';
import 'package:wts_shop/models/entity/products_data.dart';

class ApiClient {

  final client = HttpClient();

  Future<List<CategoriesData>> getCategoriesData() async {
    final categoriesJson = await get('http://ostest.whitetigersoft.ru/api/common/category/list?appKey=phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF');
    final categoriesList = List<CategoriesData>.from(categoriesJson);
    return categoriesList;
  }

  Future<List<ProductsData>> getProductsData(int categoryId) async {
    final productsJson = await get('${FlutterConfig.get('BASE_URL')}common/product/list?id=${categoryId}appKey=${FlutterConfig
        .get('WTS_SHOP_API_KEY')}');
    final productsList = List<ProductsData>.from(productsJson);
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