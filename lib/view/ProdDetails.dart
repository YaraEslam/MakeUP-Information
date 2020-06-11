import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_up/network/model/item_model.dart';
import 'package:make_up/view/AllMakeup.dart';
import 'package:responsive_container/responsive_container.dart';

class ProdDetails extends StatefulWidget {
  int index;
  List<Item> Items;
  ProdDetails(this.index, this.Items);

  @override
  _ProdDetailsState createState() => _ProdDetailsState(index);
}

class _ProdDetailsState extends State<ProdDetails> {
  int index;
  _ProdDetailsState(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: checkVerticalOrHorizontal());
  }

  checkVerticalOrHorizontal() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return _getDetailPortrait();
    } else {
      return _getDetailLandscape();
    }
  }

  _getDetailPortrait() {
    return new ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Text(
            (widget.Items[index].name) != null ? widget.Items[index].name : "",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.all(16.0),
            height: 200.0,
            width: MediaQuery.of(context).size.width - 150.0,
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: AssetImage("images/imageNotFound.jpg"),
              image: NetworkImage(
                widget.Items[index].image_link,
              ),
            )),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "Brand : ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0, right: 8.0),
              child: Text(
                (widget.Items[index].brand) != null
                    ? widget.Items[index].brand
                    : "",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
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
              padding: EdgeInsets.only(top: 8.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    (widget.Items[index].category) != null
                        ? widget.Items[index].category
                        : "",
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text("Price : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                  widget.Items[index].price != null
                      ? widget.Items[index].price
                      : "",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
            Container(
              padding: EdgeInsets.only(top: 8.0, right: 8.0),
              child: Text(
                  widget.Items[index].price_sign != null
                      ? " ${widget.Items[index].price_sign}"
                      : "",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
          ],
        ),
        new Divider(
          height: 1.0,
          color: Colors.white70,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Description : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Flexible(
                //alignment: Alignment.centerLeft,
                child: Text(
                    (widget.Items[index].description) != null
                        ? widget.Items[index].description
                        : "",
                    style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8.0, left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Tags : ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 2.0, left: 36.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.Items[index].tag_list.length,
              itemBuilder: (BuildContext context, int tagsIndex) =>
                  _tagsItems(index, tagsIndex)),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: widget.Items[index].productsColor.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int indexColor) =>
                  _colorsName(indexColor, index)),
        )
      ],
    );
  }

  _getDetailLandscape() {
    return new ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Text(
            (widget.Items[index].name) != null ? widget.Items[index].name : "",
            style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text(
                          "Brand : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Text(
                          (widget.Items[index].brand) != null
                              ? widget.Items[index].brand
                              : "",
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Category: ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              (widget.Items[index].category) != null
                                  ? widget.Items[index].category
                                  : "",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Text("Price : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                            widget.Items[index].price != null
                                ? widget.Items[index].price
                                : "",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Text(
                            widget.Items[index].price_sign != null
                                ? " ${widget.Items[index].price_sign}"
                                : "",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0)),
                      ),
                    ],
                  ),
                  new Divider(
                    height: 1.0,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 250.0,
                  width: MediaQuery.of(context).size.width / 2,
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage("images/imageNotFound.jpg"),
                    image: NetworkImage(
                      widget.Items[index].image_link,
                    ),
                  )), //any widget
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Description : ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Flexible(
                //alignment: Alignment.centerLeft,
                child: Text(
                    (widget.Items[index].description) != null
                        ? widget.Items[index].description
                        : "",
                    style: TextStyle(color: Colors.black, fontSize: 15.0)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8.0, left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Tags : ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 2.0, left: 36.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.Items[index].tag_list.length,
              itemBuilder: (BuildContext context, int tagsIndex) =>
                  _tagsItems(index, tagsIndex)),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: widget.Items[index].productsColor.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int indexColor) =>
                  _colorsName(indexColor, index)),
        )
      ],
    );
  }

  _colorsName(int indexColor, int index) {
    var color =
        "0xFF${widget.Items[index].productsColor[indexColor].hexValue.substring(1)}";
    return Container(
      child: new CircleAvatar(
          radius: 10.0,
          backgroundColor: Color(int.parse(color)),
          child: Align(
            alignment: Alignment.center,
            child: new Text(
              widget.Items[index].productsColor[indexColor].colorName,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white70,
              ),
            ),
          )),
    );
  }

  _tagsItems(int index, int indexTag) {
    return Text(
      widget.Items[index].tag_list[indexTag],
      style: TextStyle(fontSize: 15.0, color: Colors.black),
    );
  }
}
