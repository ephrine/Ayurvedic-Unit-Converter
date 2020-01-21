import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'weightconvert.dart';
import 'SelectedCategory.dart';
void main() {
  runApp(MaterialApp(
    title: 'Ayurvedic Unit Converter',
    // Start the app with the "/" named route. In this case, the app starts
    // on the HomeScreen widget.
    initialRoute: '/home',
    routes: {
      // When navigating to the "/" route, build the HomeScreen widget.
      '/home': (context) => HomeScreen(),
      // When navigating to the "/unitconvert" route, build the unitconvertScreen widget.
    //  '/weightconvert': (context) => WeightConvertScreen(),
    },
  ));
}

String cWeightTitle = "Weight";
String cLengthTitle = "Length";
String cTimeTitle = "Time";
String cAreaTitle = "Area";
String cVolumeTitle = "Volume";

// This app is a stateful, it tracks the user's current choice.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Ayurvedic Unit Converter'),
           /* actions: <Widget>[
              // overflow menu

              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: IconButton(
tooltip: 'menuu',                
        icon: Icon(Icons.email),
                        onPressed: () {
                          log("Menu Click");
                        },
                      ),
                    ),

                  ];
                },
              )
            ],*/
          ),
          body: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Center(
                    child: Column(
                  children: <Widget>[
                    Text('Select Unit'),
                    cardViewWeight(context),
                    cardViewLength(context),
                    cardViewTime(context),
                    cardViewArea(context),
                    cardViewVolume(context)
                  ],
                ))
              ])),
    );
  }

  Widget cardViewWeight(context) {
    return Center(
      child: Card(
        child: FlatButton(
            onPressed: () {
              /* ... */
              Navigator.pushNamed(context, '/weightconvert');
      
      
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Image(image: AssetImage('img/weight100px.png'), width: 50.0),
                  Text(
                    '   Weight',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  /*ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    /* ... */
                    Navigator.pushNamed(context, '/unitconvert');
                  },
                )
              ],
            ),*/
                ],
              ),
            )),
      ),
    );
  }

  Widget cardViewLength(context) {
    return Center(
      child: Card(
        child: FlatButton(
            onPressed: () {
              /* ... */
              Navigator.pushNamed(context, '/unitconvert');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Image(image: AssetImage('img/length100px.png'), width: 50.0),
                  Text(
                    '   Length',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  /*ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    /* ... */
                    Navigator.pushNamed(context, '/unitconvert');
                  },
                )
              ],
            ),*/
                ],
              ),
            )),
      ),
    );
  }

  Widget cardViewTime(context) {
    return Center(
      child: Card(
        child: FlatButton(
            onPressed: () {
              /* ... */
              Navigator.pushNamed(context, '/unitconvert');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Image(image: AssetImage('img/time100px.png'), width: 50.0),
                  Text(
                    '   Time',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  /*ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    /* ... */
                    Navigator.pushNamed(context, '/unitconvert');
                  },
                )
              ],
            ),*/
                ],
              ),
            )),
      ),
    );
  }

  Widget cardViewArea(context) {
    return Center(
      child: Card(
        child: FlatButton(
          //  splashColor: Colors.amber[100],
          onPressed: () {
            /* ... */
            Navigator.pushNamed(context, '/unitconvert');
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Image(image: AssetImage('img/area100px.png'), width: 50.0),
                Text(
                  '   Area',
                  style: TextStyle(fontSize: 20.0),
                ),

                /*ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    /* ... */
                    Navigator.pushNamed(context, '/unitconvert');
                  },
                )
              ],
            ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardViewVolume(context) {
    return Center(
      child: Card(
        child: FlatButton(
            onPressed: () {
              /* ... */
              Navigator.pushNamed(context, '/unitconvert');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Image(image: AssetImage('img/volume100px.png'), width: 50.0),
                  Text(
                    '   Volume',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  /*ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    /* ... */
                    Navigator.pushNamed(context, '/unitconvert');
                  },
                )
              ],
            ),*/
                ],
              ),
            )),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];


