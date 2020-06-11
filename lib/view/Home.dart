import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_up/view/tabs.dart';

import 'Search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: nested(),
    );
  }

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Search();
                  }));
                },
              ),
//              IconButton(
//                icon: Icon(Icons.menu),
//                color: Colors.white,
//                onPressed: () {},
//              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "MakeUp",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              background: Image.asset(
                "images/makeup brushes and powder.png",
                fit: BoxFit.fill,
              ),
            ),
          )
        ];
      },
      body: Tabs(),
    );
  }

  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
            ),
//            IconButton(
//              icon: Icon(Icons.menu),
//              color: Colors.white,
//              onPressed: () {},
//            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "MakeUp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            background: Image.asset(
              "images/makeup brushes and powder.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Tabs(),
          ),
        ),
      ],
    );
  }
}
