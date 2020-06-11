import 'package:flutter/cupertino.dart';
import 'package:make_up/network/model/item_model.dart';

abstract class ItemRepository {
  Future<List<Item>> fetchItems();

  Future<List<Item>> fetchItem(String type);

  Future<List<Item>> searchItem(BuildContext context, String type,
      String category, String brand, List<String> tags);
}
