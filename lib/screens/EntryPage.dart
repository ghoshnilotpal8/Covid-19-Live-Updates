import 'dart:async';
import 'CoverPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(milliseconds: 1100),
            () => Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (BuildContext context) => CoverPage())));
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0, bottom: 200.0)),
              Text(
                "COVID-19 Live Updates",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                  color: Colors.blue,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0),
                  child: Image.asset("assets/drawable-xxhdpi/logo.png")),
            ],
          ),
        ),
      ),
    );
  }
}
