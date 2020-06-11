import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:make_up/network/model/item_model.dart';
import 'package:make_up/presenter/itemPresenter.dart';
import 'package:make_up/view/AllMakeup.dart';

import 'chips/choiceChipWidget.dart';
import 'chips/filterChipWidget.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  List<String> typeList = [
    "blush",
    "bronzer",
    "eyebrow",
    "eyeliner",
    "eyeshadow",
    "foundation",
    "lip liner",
    "lipstick",
    "mascara",
    "nail polish",
  ];

  List<String> categoryList = [
    "powder",
    "cream",
    "pencil",
    "liquid",
    "gel",
    "palette",
    "contour",
    "bb cc",
    "concealer",
    "mineral",
    "highlighter",
    "palette",
    "lipstick",
    "lip gloss",
    "lip stain"
  ];

  List<String> brandList = [
    "almay",
    "alva",
    "anna sui",
    "annabelle",
    "benefit",
    "boosh",
    "burt's bees",
    "butter london",
    "c'est moi",
    "cargo cosmetics",
    "china glaze",
    "clinique",
    "coastal classic creation",
    "colourpop",
    "covergirl",
    "dalish",
    "deciem",
    "dior",
    "dr. hauschka",
    "e.l.f.",
    "essie",
    "fenty",
    "glossier",
    "green people",
    "iman",
    "l'oreal",
    "lotus cosmetics usa",
    "maia's mineral galaxy",
    "marcelle",
    "marienatie",
    "maybelline",
    "milani",
    "mineral fusion",
    "misa",
    "mistura",
    "moov",
    "nudus",
    "nyx",
    "orly",
    "pacifica",
    "penny lane organics",
    "physicians formula",
    "piggy paint",
    "pure anada",
    "rejuva minerals",
    "revlon",
    "sally b's skin yummies",
    "salon perfect",
    "sante",
    "sinful colours",
    "smashbox",
    "stila",
    "suncoat",
    "w3llpeople",
    "wet n wild",
    "zorah",
    "zorah biocosmetiques"
  ];

  static List<String> tags;
  static String typeChip;
  static String categoryChip;
  static String brandChip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tags = List();
    typeChip = "";
    categoryChip = "";
    brandChip = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Product type",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              choiceChipWidget(typeList, "type"),
            ],
          )),
          Divider(
            color: Colors.black12,
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Product category",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              choiceChipWidget(categoryList, "category"),
            ],
          )),
          Divider(
            color: Colors.black12,
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Brand",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
              child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: <Widget>[
              choiceChipWidget(brandList, "brand"),
            ],
          )),
          Divider(
            color: Colors.black12,
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Tags",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                spacing: 5.0,
                runSpacing: 3.0,
                children: <Widget>[
                  filterChipWidget(chipName: 'Canadian'),
                  filterChipWidget(chipName: 'CertClean'),
                  filterChipWidget(chipName: 'Chemical Free'),
                  filterChipWidget(chipName: 'Dairy Free'),
                  filterChipWidget(chipName: 'EWG Verified'),
                  filterChipWidget(chipName: 'EcoCert'),
                  filterChipWidget(chipName: 'Fair Trade'),
                  filterChipWidget(chipName: 'Gluten Free'),
                  filterChipWidget(chipName: 'Hypoallergenic'),
                  filterChipWidget(chipName: 'Natural'),
                  filterChipWidget(chipName: 'No Talc'),
                  filterChipWidget(chipName: 'Non-GMO'),
                  filterChipWidget(chipName: 'Organic'),
                  filterChipWidget(chipName: 'Peanut Free Product'),
                  filterChipWidget(chipName: 'Sugar Free'),
                  filterChipWidget(chipName: 'USDA Organic'),
                  filterChipWidget(chipName: 'Vegan'),
                  filterChipWidget(chipName: 'alcohol free'),
                  filterChipWidget(chipName: 'cruelty free'),
                  filterChipWidget(chipName: 'oil free'),
                  filterChipWidget(chipName: 'purpicks'),
                  filterChipWidget(chipName: 'silicone free'),
                  filterChipWidget(chipName: 'water free'),
                ],
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              child: RaisedButton(
                  color: Color(0xffffbf00),
                  child: new Text(
                    'Search',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return AllMakeup(
                        typeChip: typeChip,
                        category: categoryChip,
                        brand: brandChip,
                        tags: tags,
                        widget: "search",
                        type: " ",
                      );
                    }));
                    print(
                        "product_type=$typeChip&&product_category=$categoryChip&&brand=$brandChip&&product_tags=${tags.join(", ")}");
//                    typeChip = "";
//                    categoryChip = "";
//                    brandChip = "";
//                    tags = List();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
            ),
          )
        ],
      ),
    );
  }
}
