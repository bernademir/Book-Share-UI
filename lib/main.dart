//import 'package:bookshareui/view/discover_view.dart';
import 'package:bookshareui/widget/bottom_navbar_widget.dart';
//import 'package:bookshareui/view/welcome_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: //WelcomeView(),
          //DiscoverView(),
          MyCustomNavBar(),
    );
  }
}
