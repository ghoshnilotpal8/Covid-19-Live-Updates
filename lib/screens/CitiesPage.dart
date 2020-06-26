import 'package:flutter/material.dart';
// import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CitiesPage extends StatefulWidget {
  CitiesPage({Key key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> with TickerProviderStateMixin {
  final String officialUrl = "https://api.rootnet.in/covid19-in/stats/latest";
  List statesDetailedData;
  bool isLoading = true;
  AnimationController animationController;
  AnimationController animationController2;

  Future getDataForCitiesFromApi() async {
    var response = await http.get(Uri.encodeFull(officialUrl),
        headers: {"Accept": "application/json"});

    List data = jsonDecode(response.body)["data"]['regional'];
    setState(() {
      statesDetailedData = data;
      isLoading = false;
    });

    // print(statesDetailedData);
  }

  @override
  void initState() {
    super.initState();
    this.getDataForCitiesFromApi();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animationController.repeat();
    animationController2 = AnimationController(vsync: this, duration: Duration(seconds: 4));
    animationController2.forward();
  }

  @override
  void dispose() {
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
          backgroundColor: Colors.orange,
          flexibleSpace: FlexibleSpaceBar(
            background: isLoading
                ? FadeTransition(
                    opacity: animationController,
                    child: Image.asset("assets/images/asset3.jpg",
                        fit: BoxFit.cover),
                  )
                : Image.asset("assets/images/asset3.jpg", fit: BoxFit.cover),
          ),
          title: isLoading
          ?Text("")
          : FadeTransition(opacity: animationController2,
                      child: Text(
              "Covid-19 in INDIA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return isLoading ? Container() : _cities(context, index);
        }, childCount: isLoading ? 0 : statesDetailedData.length))
      ],
    );
  }

  Widget _cities(BuildContext context, int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          elevation: 5.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      statesDetailedData[index]['loc'],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Confirmed Cases: "),
                      Text(
                        statesDetailedData[index]['totalConfirmed'].toString(),
                        style: TextStyle(fontSize: 27.0, color: Colors.orange),
                      )
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Recovered", style: TextStyle(fontSize: 11.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Deceased',
                        style: TextStyle(fontSize: 11.0),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 23.0, 8.0),
                      child: Text(
                        statesDetailedData[index]['discharged'].toString(),
                        style: TextStyle(fontSize: 27.0, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
                      child: Text(
                        statesDetailedData[index]['deaths'].toString(),
                        style: TextStyle(fontSize: 27.0, color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
