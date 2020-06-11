import 'package:make_up/network/model/color_model.dart';

class Item {
  final int id;
  final String brand;
  final String name;
  final String price;
  final String price_sign;
  final String currency;
  final String image_link;
  final String product_link;
  final String website_link;
  final String description;
  final double rating;
  final String category;
  final String product_type;
  final List<String> tag_list;
  final String created_at;
  final String updated_at;
  final String product_api_url;
  final List<ColorList> productsColor;

  Item(
      {this.name,
      this.id,
      this.brand,
      this.category,
      this.currency,
      this.description,
      this.price,
      this.price_sign,
      this.image_link,
      this.updated_at,
      this.created_at,
      this.product_api_url,
      this.product_link,
      this.product_type,
      this.rating,
      this.tag_list,
      this.website_link,
      this.productsColor});

//  factory Item.fromJson(Map<String, dynamic> map) {
//    return Item(
//        name: map['name'],
//        id: map['id'],
//        brand: map['brand'],
//        category: map['category'],
//        currency: map['currency'],
//        description: map['description'],
//        price: map['price'],
//        price_sign: map['price_sign'],
//        image_link: map['image_link'],
//        updated_at: map['updated_at'],
//        created_at: map['created_at'],
//        product_api_url: map['product_api_url'],
//        product_link: map['product_link'],
//        product_type: map['product_type'],
//        rating: map['rating'],
//        tag_list: map['tag_list'],
//        website_link: map['website_link'],
//        productsColor: parseColors(map));
//  }

  Item.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        id = map['id'],
        brand = map['brand'],
        category = map['category'],
        currency = map['currency'],
        description = map['description'],
        price = map['price'],
        price_sign = map['price_sign'],
        image_link = map['image_link'],
        updated_at = map['updated_at'],
        created_at = map['created_at'],
        product_api_url = map['product_api_url'],
        product_link = map['product_link'],
        product_type = map['product_type'],
        rating = map['rating'],
        tag_list = parseTags(map['tag_list']),
        website_link = map['website_link'],
        productsColor = parseColors(map);

  static List<String> parseTags(tagsJson) {
    List<String> tagsList = new List<String>.from(tagsJson);
    return tagsList;
  }

  static List<ColorList> parseColors(colorsJson) {
    var list = colorsJson['product_colors'] as List;
    List<ColorList> colorsList =
        list.map((data) => new ColorList.fromJson(data)).toList();
    return colorsList;
  }
}
