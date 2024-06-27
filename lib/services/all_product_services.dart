// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Models/product_model.dart';

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
    // *Make an HTTP GET request to the specified URL and await the response
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      // *Decode the response body text into a dynamic list
      List<dynamic> data = jsonDecode(response.body);
      // Initialize a list to store the ProductModel objects
      List<ProductModel> productsList = [];
      // & Iterate over each item in the received data, convert it to a ProductModel object, and add it to the list
      for (var i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }
      // &Return the list of products
      return productsList;
    } else {
      throw Exception(
          'there is a problem with the status code ${response.statusCode}');
    }
  }
}
