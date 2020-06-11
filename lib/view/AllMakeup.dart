import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:make_up/network/model/item_model.dart';
import 'package:make_up/presenter/itemPresenter.dart';
import 'package:make_up/view/ProdDetails.dart';
import 'package:responsive_container/responsive_container.dart';

class AllMakeup extends StatefulWidget {
  String type;
  String widget;
  List<String> tags;
  String typeChip;
  String category;
  String brand;

  AllMakeup(
      {this.widget,
      this.type,
      this.typeChip,
      this.category,
      this.brand,
      this.tags});

  @override
  AllMakeupState createState() => new AllMakeupState();
}

class AllMakeupState extends State<AllMakeup> implements ItemListViewContract {
  ItemListPresenter _presenter;
  List<Item> Items;
  bool _isLoading;

  AllMakeupState() {
    _presenter = new ItemListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    if (widget.widget == "home") {
      switch (widget.type) {
        case "All":
          _presenter.loadItems();
          break;
        default:
          _presenter.loadItem(widget.type);
          break;
      }
    } else {
      _presenter.searchItems(
          context, widget.typeChip, widget.category, widget.brand, widget.tags);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: _isLoading
            ? Center(child: RefreshProgressIndicator())
            : checkVerticalOrHorizontal());
  }

//  _shimmer() {
//    return SafeArea(
//      child: ListView.builder(
//        itemCount: 6,
//        shrinkWrap: true,
//        physics: ClampingScrollPhysics(),
//        itemBuilder: (BuildContext context, int index) {
//          return Padding(
//              padding: EdgeInsets.symmetric(horizontal: 15),
//              child: Shimmer.fromColors(
//                highlightColor: Colors.white,
//                baseColor: Colors.grey[300],
//                child: Container(
//                  margin: EdgeInsets.symmetric(vertical: 7.5),
//                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Container(
//                        height: 100,
//                        width: 100,
//                        color: Colors.grey,
//                      ),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            height: 280,
//                            width: 15,
//                            color: Colors.grey,
//                          ),
//                          SizedBox(height: 5),
//                          Container(
//                            height: 280,
//                            width: 15,
//                            color: Colors.grey,
//                          ),
//                          SizedBox(height: 5),
//                          Container(
//                            height: 280,
//                            width: 15 * 0.75,
//                            color: Colors.grey,
//                          )
//                        ],
//                      )
//                    ],
//                  ),
//                ),
//                period: Duration(milliseconds: 5),
//              ));
//        },
//      ),
//    );
//  }

  checkVerticalOrHorizontal() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return new GridView.builder(
          itemCount: Items.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              _getItemsPortrait(index));
    } else {
      return new GridView.builder(
          itemCount: Items.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2.5),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              _getItemsLandscape(index));
    }
  }

  _getItemsPortrait(int index) {
    return new Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProdDetails(index, Items);
          }));
        },
        child: new Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                side: BorderSide(
                    width: 2.0,
                    style: BorderStyle.solid,
                    color: Colors.white30)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: new ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ResponsiveContainer(
                      heightPercent: 10.0,
                      widthPercent: 8.0,
                      child: FadeInImage(
                        fit: BoxFit.contain,
                        placeholder: AssetImage("images/imageNotFound.jpg"),
                        image: NetworkImage(
                          Items[index].image_link,
                        ),
                      ) //any widget
                      ),
                  Container(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      (Items[index].brand) != null ? Items[index].brand : "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      (Items[index].name) != null ? Items[index].name : "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Category: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              (Items[index].category) != null
                                  ? Items[index].category
                                  : "",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                            Items[index].price != null
                                ? Items[index].price
                                : "",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Text(
                            Items[index].price_sign != null
                                ? " ${Items[index].price_sign}"
                                : "",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _getItemsLandscape(int index) {
    return new Container(
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProdDetails(index, Items);
              }));
            },
            child: new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        (Items[index].brand) != null ? Items[index].brand : "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: ResponsiveContainer(
                              padding: EdgeInsets.all(8.0),
                              heightPercent: 25.0,
                              widthPercent:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInImage(
                                fit: BoxFit.contain,
                                placeholder:
                                    AssetImage("images/imageNotFound.jpg"),
                                image: NetworkImage(
                                  Items[index].image_link,
                                ),
                              ) //any widget
                              ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0),
                                child: Text(
                                  (Items[index].name) != null
                                      ? Items[index].name
                                      : "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 8.0, left: 8.0, right: 8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Category: ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 8.0, left: 8.0, right: 8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          (Items[index].category) != null
                                              ? Items[index].category
                                              : "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 8.0, left: 8.0),
                                    child: Text(
                                        Items[index].price != null
                                            ? Items[index].price
                                            : "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 8.0, right: 8.0),
                                    child: Text(
                                        Items[index].price_sign != null
                                            ? " ${Items[index].price_sign}"
                                            : "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }

  @override
  void onLoadItemComplete(List<Item> items) {
    setState(() {
      Items = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadItemError() {
    // TODO: implement onLoadItemError
  }
}
