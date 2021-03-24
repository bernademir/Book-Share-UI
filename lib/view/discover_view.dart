import 'package:bookshareui/widget/clipper_widget.dart';
import 'package:flutter/material.dart';

class DiscoverView extends StatefulWidget {
  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyCustomClipper1(),
                child: Container(
                  color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                ),
              ),
              ClipPath(
                clipper: MyCustomClipper2(),
                child: Container(
                  color: Colors.white24,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2 - 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
