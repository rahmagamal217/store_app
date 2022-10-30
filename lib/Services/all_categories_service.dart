import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_model.dart';

class AllCategoriesService {
  Future<List<ProductModel>> getAllCategories() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
