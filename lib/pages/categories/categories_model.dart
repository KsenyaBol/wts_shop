import 'package:flutter/cupertino.dart';
import 'package:wts_shop/models/entity/categories_data.dart';

import '../../models/api/api_client.dart';

class CategoriesWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _categories = <CategoriesData>[];
  List<CategoriesData> get categories => _categories;

  Future<void> reloadCategories() async {
    final categoriesList = await apiClient.getCategoriesData();
    _categories += categoriesList;
    notifyListeners();
  }

}

class CategoriesModelProvider extends InheritedNotifier {
  final CategoriesWidgetModel model;
  const CategoriesModelProvider({Key? key, required this.model, required Widget child,}) : super(key: key, child: child,);

  static CategoriesModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoriesModelProvider>();
  }

  static CategoriesModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<CategoriesModelProvider>()?.widget;
    return widget is CategoriesModelProvider ? widget : null;
  }

  // @override
  // bool updateShouldNotify(CategoriesModelProvider oldWidget) {
  //   return true;
  // }

}