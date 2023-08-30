import 'package:flutter/material.dart';
import 'package:wts_shop/pages/categories/categories_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.title});

  final String title;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();

  @override
  void  initState() {
    // CategoriesModelProvider.read(context)?.model.reloadCategories();
  }

}

class _CategoriesPageState extends State<CategoriesPage> {
  final categoriesModel = CategoriesWidgetModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(title: const Text("WTS shop")),
      body: SafeArea(
          child: CategoriesModelProvider(
            model: categoriesModel,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(categoriesModel.categories.length, (index) {
                return const Center(
                  child: _CategoriesWidget(),
                );
              }),
            ),
          ))
    );
  }

}

class _CategoriesWidget extends StatelessWidget {
  const _CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CategoriesModelProvider.watch(context)?.model.categories.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _CategoriesGridWidget(index: index);
    },
    );
  }
}

class _CategoriesGridWidget extends StatelessWidget {
  final int index;
  const _CategoriesGridWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = CategoriesModelProvider.read(context)!.model.categories[index];
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Text(category.title),
        Image.network(category.imageUrl),
      ],
    );
  }

}