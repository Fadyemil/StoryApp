// ignore_for_file: missing_required_param

import 'package:store_app/Models/product_model.dart';
import 'package:store_app/helper/api.dart';

class UpdateProduct {
  Future<ProductModel> upDate(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      required int id}) async {
    Map<String, dynamic> data =
        await Api().put(uri: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
