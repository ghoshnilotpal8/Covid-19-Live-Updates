import 'package:covid19LiveUpdates/screens/CitiesPage.dart';
import 'package:covid19LiveUpdates/screens/HomePage.dart';
import 'package:covid19LiveUpdates/screens/WorldPage.dart';
import 'package:flutter/material.dart';
import '../asset/my_flutter_app_icons.dart';
import 'Info.dart';

class CoverPage extends StatefulWidget {
  CoverPage({Key key}) : super(key: key);

  @override
  _CoverPageState createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  int _selectedIndex = 0;
  Widget screen = HomePage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
                minWidth: 30.0,
                elevation: 10.0,
                selectedIndex: _selectedIndex,
                groupAlignment: 0.0,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                    // print(_selectedIndex);
                    switch (_selectedIndex) {
                      case 0:
                        screen = HomePage();
                        break;
                      case 1:
                        screen = Info();
                        break;
                      case 2:
                        screen = CitiesPage();
                        break;
                      case 3:
                        screen = WorldPage();
                        break;
                    }
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home, color: Colors.orange,),
                    label: Text('Home', style: TextStyle(color: Colors.orange),),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    selectedIcon: Icon(Icons.info, color: Colors.orange,),
                    label: Text('Info', style: TextStyle(color: Colors.orange),),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.business),
                    selectedIcon: Icon(Icons.business, color: Colors.orange,),
                    label: Text('States', style: TextStyle(color: Colors.orange),),
                  ),
                  NavigationRailDestination(
                    icon: Icon(MyFlutterApp.earth),
                    selectedIcon: Icon(MyFlutterApp.earth, color: Colors.orange,),
                    label: Text('World', style: TextStyle(color: Colors.orange),),
                  ),
                ]),
            Expanded(
              child: screen,
            ),
          ],
        ),
      ),
    );
  }
}
