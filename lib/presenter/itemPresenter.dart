import 'package:flutter/cupertino.dart';
import 'package:make_up/network/ItemRepository.dart';
import 'package:make_up/network/model/item_model.dart';
import 'package:make_up/utils/dependency_injection.dart';

abstract class ItemListViewContract {
  void onLoadItemComplete(List<Item> items);
  void onLoadItemError();
}

class ItemListPresenter {
  ItemListViewContract _view;
  ItemRepository _repository;

  ItemListPresenter(this._view) {
    _repository = new Injector().itemRepository;
  }

  void loadItems() {
    _repository
        .fetchItems()
        .then((c) => _view.onLoadItemComplete(c))
        .catchError((onError) => _view.onLoadItemError());
  }

  void loadItem(String type) {
    _repository
        .fetchItem(type)
        .then((c) => _view.onLoadItemComplete(c))
        .catchError((onError) => _view.onLoadItemError());
  }

  void searchItems(BuildContext context, String type, String category,
      String brand, List<String> tags) {
    _repository
        .searchItem(context, type, category, brand, tags)
        .then((c) => _view.onLoadItemComplete(c))
        .catchError((onError) => _view.onLoadItemError());
  }
}
