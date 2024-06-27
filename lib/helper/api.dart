// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  //~ The get method accepts a URL and returns the received data

  Future<dynamic> get({required String uri}) async {
    //~ Send an HTTP GET request to the specified URL

    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      //~ If the status code is 200 (success), parse the body and convert it to a JSON object

      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with the status code ${response.statusCode}');
    }
  }
}
