// ignore_for_file: missing_required_param, unused_local_variable

// import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/helper/api.dart';

class AddProdectServices {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(uri: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
