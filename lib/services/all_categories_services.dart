import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    // *Decode the response body text into a dynamic list
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
