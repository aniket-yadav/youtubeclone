import 'package:YouTube/view/home.dart';
import 'package:YouTube/view/explore.dart';
import 'package:YouTube/view/library.dart';
import 'package:YouTube/view/subscriptions.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(YouTube());
}

class YouTube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/logo.png"),
        splashIconSize: 150,
        nextScreen: Launcher(),
      ),
    );
  }
}

class Launcher extends StatefulWidget {
  Launcher({Key key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  final List<Widget> PAGES = <Widget>[
    Home(),
    Explore(),
    SizedBox(),
    Subscription(),
    Library()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                height: 40,
                width: 30,
              ),
              Text(
                "YouTube",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black54),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.search, color: Colors.black54), onPressed: null),
          IconButton(
            icon: CircleAvatar(
              child: Text(
                "A",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: null,
          ),
        ],
      ),
      body: PAGES.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(
              Icons.explore,
              color: Colors.black54,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black54,
                size: 50,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions,
                color: Colors.black54,
                size: 25,
              ),
              label: "Subscription"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library,
                color: Colors.black54,
                size: 25,
              ),
              label: "Library"),
        ],
        onTap: (index) {
          if (index == 2) {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: MaterialButton(
                                elevation: 0,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Create",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    child: Icon(Icons.upload_rounded),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Upload a video"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                });
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
