import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'Iconcontent.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Organic();
  }
}

class Post {
  final String title;
  final String description;
  Post(this.title, this.description);
}

class Organic extends StatefulWidget {
  @override
  _OrganicState createState() => _OrganicState();
}

class _OrganicState extends State<Organic> {
  int _selected = 0;
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          titleSpacing: 55,
          backgroundColor: Colors.white,
          title: Text(
            'Pets Corner',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
          ),
        ),
        body: SafeArea(
          child: Flexible(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Pet Category',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            //  padding: EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            width: 115,
                          ),
                          Container(
                            child: FlatButton(
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  //   textBaseline: TextBaseline.alphabetic,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                              //  padding: EdgeInsets.only(bottom: 18),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Reusable(
                              onPress: () {
                                setState(() {});
                              },
                              cardChild: Iconcontent(
                                face: 'images/dogicon.png',
                                type: "Dogs",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 27,
                          ),
                          Expanded(
                            flex: 6,
                            child: Reusable(
                              onPress: () {
                                setState(() {});
                              },
                              cardChild: Iconcontent(
                                face: 'images/catimage.png',
                                type: "Cats",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Reusable(
                              onPress: () {
                                setState(() {});
                              },
                              cardChild: Iconcontent(
                                face: 'images/fish.webp',
                                type: "Fishes",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 27,
                          ),
                          Expanded(
                            flex: 6,
                            child: Reusable(
                              onPress: () {
                                setState(() {});
                              },
                              cardChild: Iconcontent(
                                face: 'images/rabbit.png',
                                type: "rabbits",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 45,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'Featured Pets',
                              style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            //  padding: EdgeInsets.all(10),
                            // alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            child: FlatButton(
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  //   textBaseline: TextBaseline.alphabetic,
                                  fontFamily: 'PlayfairDisplay',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                              //  padding: EdgeInsets.only(bottom: 18),
                            ),
                            // alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow.shade700),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(''),
                      child: Text(
                        'Pets corner',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                selected: _selected == 0,
                leading: Icon(Icons.settings, size: 15, color: Colors.black),
                title: Text('Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                onTap: () {
                  ChangeSelected(0);
                },
              ),
              ListTile(
                selected: _selected == 1,
                leading:
                    Icon(Icons.notifications, size: 15, color: Colors.black),
                title: Text('Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                onTap: () {
                  ChangeSelected(0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void ChangeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }
}
