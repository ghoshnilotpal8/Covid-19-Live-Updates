import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isLoading = true;
  final String officialUrl = "https://api.rootnet.in/covid19-in/stats/latest";
  var data;
  var requiredData;
  String totalConfirmedcase;
  String totalRecoverdcase;
  String totalDeathcase;
  AnimationController animationController, animationController2;
  Animation<double> _animation;
  // getting data from api
  Future _getDataFromApi() async {
    var response = await http.get(Uri.encodeFull(officialUrl),
        headers: {"Accept": "application/json"});
    data = jsonDecode(response.body);
    setState(() {
      isLoading = false;
    });

    if (data is Map) {
      var items = data as Map;
      for (var key in items.keys) {
        // print('map item: $key, ${items[key]}');
        if (key == 'data') {
          var dataitem = items[key];
          for (var key2 in dataitem.keys) {
            if (key2 == "summary") {
              requiredData = dataitem[key2];
              break;
            }
          }
        }
      }
    }
    totalConfirmedcase = requiredData['confirmedCasesIndian'].toString();
    totalRecoverdcase = requiredData['discharged'].toString();
    totalDeathcase = requiredData['deaths'].toString();
  }

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animationController.repeat();
    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1800));
    _animation = CurvedAnimation(parent: animationController2, curve: Curves.bounceInOut);
    animationController2.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/images/asset1.png"),
        Padding(padding: EdgeInsets.only(top: 5.0)),
        Center(
            child: isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: RotationTransition(
                      turns: animationController,
                      child: Image.asset("assets/images/asset9.png"),
                    ),
                  )
                : ScaleTransition(
                    scale: _animation,
                    child: Container(
                      width: 200.0,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 40.0),
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text("Total Cases in INDIA",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  margin:
                                      EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                  elevation: 10.0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(totalConfirmedcase,
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.orange)),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text('Total Recovered in INDIA',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  margin:
                                      EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                  elevation: 10.0,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        totalRecoverdcase,
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.green),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text('Total Deaths in INDIA',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  margin:
                                      EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                  elevation: 10.0,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Text(
                                        totalDeathcase,
                                        style: TextStyle(
                                            fontSize: 30.0, color: Colors.red),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
      ],
    );
  }
}
