import 'package:covid19LiveUpdates/screens/EntryPage.dart';
import 'package:flutter/material.dart';
import 'screens/EntryPage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EntryPage(),
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}