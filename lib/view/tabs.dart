import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_up/view/AllMakeup.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 11, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: TabBar(
            controller: controller,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelStyle:
                TextStyle(color: Colors.white, fontSize: 15.0),
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25.0),
            indicatorColor: Colors.red,
            //unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: new Image(
                  image: new AssetImage("images/makeup.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Makeup",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Blush.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Blush",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Bronzer.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Bronzer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Eyebrow.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Eyebrow",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Eyeliner.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Eyeliner",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Eyeshadow.jpeg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Eyeshadow",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Foundation.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Foundation",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Lip liner.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Lip liner",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Lipstick.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Lipstick",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Mascara.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Mascara",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: new Image(
                  image: new AssetImage("images/Nail polish2.jpg"),
                  width: 100.0,
                  height: 30.0,
                ),
                child: Text(
                  "Nail polish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            new Container(
                child: AllMakeup(
              type: "All",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "blush",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "bronzer",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "eyebrow",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "eyeliner",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "eyeshadow",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "foundation",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "lip liner",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "lipstick",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "mascara",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
            new Container(
                child: AllMakeup(
              type: "nail polish",
              brand: "",
              category: "",
              tags: [""],
              typeChip: "",
              widget: "home",
            )),
          ],
        ),
      ),
    );
  }
}
