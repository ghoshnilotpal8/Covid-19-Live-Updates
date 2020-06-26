import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 240,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Protect your Family and Yourself', style: TextStyle(fontWeight: FontWeight.bold),),
              background: Image.asset("assets/images/asset4.jpg", fit: BoxFit.cover,)
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                elevation: 10.0,
                child: Padding(padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/asset8.png",width: 70.0),
                      Text("Wear Mask everytime you come in close contatc with anyone",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ) 
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                elevation: 10.0,
                child: Padding(padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/asset7.png",width: 70.0),
                      Text("Mantain social distancing even with your family members",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ) 
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                elevation: 10.0,
                child: Padding(padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/asset5.png",width: 70.0),
                      Text("Wash your hands frequenty",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ) 
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                elevation: 10.0,
                child: Padding(padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/asset10.png",width: 70.0),
                      Text("Avoid touching your nose",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ) 
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                elevation: 10.0,
                child: Padding(padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/asset11.png", width: 70.0),
                      Text("Download Arogya Setu",style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ) 
                ),
              ),
            ]
          ))
        ],
      ),

    );
  }
}