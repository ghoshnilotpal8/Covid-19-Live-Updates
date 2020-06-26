import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldPage extends StatefulWidget {
  WorldPage({Key key}) : super(key: key);

  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> with TickerProviderStateMixin {
  String worldUrl = "https://corona.lmao.ninja/v2/countries?yesterday&sort";
  bool isLoading = true;
  List worldData = [];
  
  AnimationController animationController;
  AnimationController animationController2;

  Future _getWorlddata() async {
    var response = await http
        .get(Uri.encodeFull(worldUrl), headers: {"Accept": "application/json"});
    List data = jsonDecode(response.body);
    setState(() {
      this.worldData = data;
      isLoading = false;
    });
    // print(worldData);
  }

  @override
  void initState() {
    super.initState();
    _getWorlddata();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.repeat();
    animationController2 = AnimationController(vsync: this, duration: Duration(seconds: 4));
    animationController2.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          elevation: 20.0,
          expandedHeight: 250,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            background: isLoading
            ? FadeTransition(opacity: animationController, child:Image.asset( "assets/images/asset2.jpg",fit: BoxFit.cover,))
            : Image.asset(
              "assets/images/asset2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          title: isLoading 
          ?Text("")
          :FadeTransition(opacity: animationController2,
                      child: Text('Covid-19 Around the World',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return isLoading
                  ? Container()
                  : _worldData(context, index);
            },
            childCount: isLoading
                      ?0
                      : worldData.length,
          ),
        ),
      ],
    );
  }

  Widget _worldData(BuildContext context, int index) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 2.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    worldData[index]['country'],
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Total Cases: "),
              Text(
                worldData[index]['cases'].toString(),
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Recovered: '),
              Text(
                worldData[index]['recovered'].toString(),
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Deaths: '),
              Text(
                worldData[index]['deaths'].toString(),
                style: TextStyle(color: Colors.red, fontSize: 25.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
