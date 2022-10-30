import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: 'http://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
