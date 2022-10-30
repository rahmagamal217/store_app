import 'package:flutter/material.dart';
import 'package:store_app/Services/all_categories_service.dart';
import 'package:store_app/Services/get_category_service.dart';

import '../Models/product_model.dart';
import '../Widgets/custom_widget.dart';

class CategoryPaga extends StatelessWidget {
  const CategoryPaga({super.key});
  static String id = 'Category page';

  @override
  Widget build(BuildContext context) {
    String selectedValue = ModalRoute.of(context)!.settings.arguments as String;
    var futureBuilder = FutureBuilder<List<ProductModel>>(
      future: selectedValue != 'All'
          ? CategoriesService()
              .getCategoriesProducts(categoryName: selectedValue)
          : AllCategoriesService().getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          return GridView.builder(
              itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  products: products[index],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedValue.toUpperCase(),
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 65,
        ),
        child: futureBuilder,
      ),
    );
  }
}
