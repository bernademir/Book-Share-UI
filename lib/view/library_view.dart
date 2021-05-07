import 'package:flutter/material.dart';

import '../model/image_manager.dart';
import '../widget/float_app_bar.dart';

class LibraryView extends StatefulWidget {
  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  late final ImageManager imageManager;

  List headlines = ["General", "New", "Most Viewed"];

  @override
  void initState() {
    imageManager = ImageManager();
    super.initState();
  }

  bool pressed0 = false;
  bool pressed1 = false;
  bool pressed2 = false;

  List colors = [
    Colors.blue[300],
    Colors.purple[300],
    Colors.green[300],
    Colors.pink[300],
    Colors.yellow[800],
    Colors.blue[900]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatAppBar(),
      body: ListView(
        children: [
          _menuRow(context),
          _mainContainerGrid(context),
        ],
      ),
    );
  }

  _menuRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              setState(() {
                pressed0 = !pressed0;
              });
            },
            child: _clickableText(0, context, pressed0),
          ),
        )),
        Expanded(
          child: _textButton(1, context, pressed1),
        ),
        Expanded(
          child: _textButton(2, context, pressed2),
        ),
      ],
    );
  }

  _textButton(int i, BuildContext context, bool pressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            pressed = !pressed;
          });
        },
        child: _clickableText(i, context, pressed),
      ),
    );
  }

  _clickableText(int j, BuildContext context, bool pressedd) {
    return Text(
      headlines[j],
      style: Theme.of(context).textTheme.headline5!.copyWith(
          color:
              pressedd ? Color.fromRGBO(255, 110, 161, 1.0) : Colors.black26),
    );
  }

  _mainContainerGrid(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 4 * MediaQuery.of(context).size.height / 3,
      child: GridView.count(
        padding: EdgeInsets.only(top: 0),
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.65,
        crossAxisCount: 2,
        children: [
          for (var i = 0; i < 6; i++) _containerGrid(i, context),
        ],
      ),
    );
  }

  _containerGrid(int i, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors[i],
      ),
      margin: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Align(
              alignment: Alignment.center,
              child: _cardText(context),
            ),
            SizedBox(height: 8.0),
            _gridCard(context),
          ],
        ),
      ),
    );
  }

  _cardText(BuildContext context) {
    return Text(
      "Category",
      style:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
    );
  }

  _gridCard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Image.network(
          imageManager.randomImage,
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.width / 3 + 50,
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
    );
  }
}
