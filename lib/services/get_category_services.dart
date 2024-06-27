// ignore_for_file: missing_required_param

import 'package:store_app/Models/get_category_model.dart';
import 'package:store_app/helper/api.dart';

class GetCategoriesServices {
  Future<List<getCategory_Model>> getCagegort(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(uri: 'https://fakestoreapi.com/products/category/$categoryName');

    List<getCategory_Model> productsList = [];

    for (var i = 0; i < data.length; i++) {
      productsList.add(getCategory_Model.fromJson(data[i]));
    }
    return productsList;
  }
}
