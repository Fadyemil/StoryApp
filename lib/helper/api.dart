// ignore_for_file: unused_local_variable

import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  //~ The get method accepts a URL and returns the received data

  Future<dynamic> get({
    required String uri,
    @required String? tokeen,
  }) async {
    Map<String, String> headers = {};
    if (tokeen != null) {
      headers.addAll({
        'Authorization': 'Bearer $tokeen',
      });
    }
    //~ Send an HTTP GET request to the specified URL
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: headers,
    );

    if (response.statusCode == 200) {
      //~ If the status code is 200 (success), parse the body and convert it to a JSON object

      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with the status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String uri,
    @required dynamic body,
    @required String? tokeen,
  }) async {
    Map<String, String> headers = {};
    if (tokeen != null) {
      headers.addAll({
        'Authorization': 'Bearer $tokeen',
      });
    }
    http.Response response = await http.post(
      Uri.parse(uri),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with the status code ${response.statusCode}+${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put({
    required String uri,
    @required dynamic body,
    @required String? tokeen,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (tokeen != null) {
      headers.addAll({
        'Authorization': 'Bearer $tokeen',
      });
    }
    http.Response response = await http.put(
      Uri.parse(uri),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with the status code ${response.statusCode}+${jsonDecode(response.body)}',
      );
    }
  }
}
