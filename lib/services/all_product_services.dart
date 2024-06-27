// ignore_for_file: missing_required_param

import 'package:store_app/Models/product_model.dart';
import 'package:store_app/helper/api.dart';

class AllProductServices {
  /** 
     * ^ code in the postman test list times
     * var request =
        http.Request('GET', Uri.parse('https://fakestoreapi.com/products'));
     * 
     * http.StreamedResponse response = await request.send();
     * 
     * if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
     */

  // Define an asynchronous function that returns a Future containing a list of ProductModel
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(uri: 'https://fakestoreapi.com/products');

    // Initialize a list to store the ProductModel objects
    List<ProductModel> productsList = [];
    // & Iterate over each item in the received data, convert it to a ProductModel object, and add it to the list
    for (var i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    // &Return the list of products
    return productsList;
  }
}
