import 'package:flutter/material.dart';
import 'package:store_app/Services/add_product.dart';
import 'package:store_app/Widgets/custom_button_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Widgets/show_snack_bar.dart';

import '../Widgets/custom_form_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  static String id = 'add product page';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? productName;

  String? desc;

  String? price;

  String? image;
  String? category;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomFormTextField(
                hintText: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                hintText: 'Description',
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                hintText: 'Price',
                onChanged: (data) {
                  price = data;
                },
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                hintText: 'Image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                hintText: 'Category',
                onChanged: (data) {
                  category = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                text: 'Add',
                onTap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await addProduct();
                    // ignore: use_build_context_synchronously
                    showSnackBar(context, 'Added');
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  isloading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    await AddProduct().addProduct(
      title: productName!,
      price: price!,
      desc: desc!,
      image: image!,
      category: category!,
    );
  }
}
