import 'package:flutter/material.dart';
import 'package:store_app/Screens/gategory_page.dart';
import 'package:store_app/Screens/home_page.dart';
import 'package:store_app/Screens/update_product_page.dart';

import 'Screens/add_product_pagr.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: ((context) => const HomePage()),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
        AddProductPage.id: (context) => const AddProductPage(),
        CategoryPaga.id: (context) => const CategoryPaga(),
      },
      initialRoute: HomePage.id,
    );
  }
}
