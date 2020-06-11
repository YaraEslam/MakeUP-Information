class ColorList {
  String hexValue;
  String colorName;

  ColorList({this.colorName, this.hexValue});

  factory ColorList.fromJson(Map<String, dynamic> json) {
    return ColorList(
        hexValue: json["hex_value"], colorName: json["colour_name"]);
  }
}
