import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_up/network/ItemRepository.dart';
import 'package:make_up/network/model/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:make_up/utils/exception.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ProdItemRepository implements ItemRepository {
  String itemUrl = "http://makeup-api.herokuapp.com/api/v1/products.json";
  @override
  Future<List<Item>> fetchItems() async {
    http.Response response = await http.get(itemUrl);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }
    return responseBody.map((c) => new Item.fromMap(c)).toList();
  }

  @override
  Future<List<Item>> fetchItem(String type) async {
    http.Response response = await http.get("$itemUrl?product_type=$type");
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }
    return responseBody.map((c) => new Item.fromMap(c)).toList();
  }

  @override
  Future<List<Item>> searchItem(BuildContext context, String type,
      String category, String brand, List<String> tags) async {
    http.Response response = await http.get(
        "$itemUrl?product_type=$type&&product_category=$category&&brand=$brand");
    if (tags.isNotEmpty)
      response = await http.get(
          "$itemUrl?product_type=$type&&product_category=$category&&brand=$brand&&product_tags=${tags.join(", ")}");

    print(
        "$itemUrl?product_type=$type&&product_category=$category&&brand=$brand&&product_tags=${tags.join(", ")}");
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      print("An error ocurred : [Status Code : $statusCode]");
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    } else if (responseBody.isEmpty) {
      Fluttertoast.showToast(
          msg: "No products with these choices",
          fontSize: 20.0,
          backgroundColor: Colors.yellowAccent,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black);
      Navigator.pop(context);
    }
    print("No error ocurred : [Status Code : $statusCode]");
    return responseBody.map((c) => new Item.fromMap(c)).toList();
  }
}
