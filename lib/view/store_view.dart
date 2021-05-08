import 'package:flutter/material.dart';

import '../model/image_manager.dart';
import '../widget/float_app_bar.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  late final ImageManager imageManager;

  @override
  void initState() {
    imageManager = ImageManager();
    super.initState();
  }

  String pinkButtonText = "Add to chart";
  String whiteButtonText = "Add to wishlist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatAppBar(),
      body: ListView(
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _bookContainer(context),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    flex: 3,
                    child: _bookDetails(context),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  _bookDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bookNameText(context),
        _writerNameText(),
        _stars(),
        _contentText(),
        SizedBox(height: 25.0),
        _textButtonsRow(context),
      ],
    );
  }

  _textButtonsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _pinkTextButton(context),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: _whiteTextButton(context),
        ),
      ],
    );
  }

  _whiteTextButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: _textButton(Colors.black87, whiteButtonText),
    );
  }

  _pinkTextButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 110, 161, 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: _textButton(Colors.white, pinkButtonText),
    );
  }

  _textButton(Color color, String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }

  _contentText() {
    return Text(
      "Content of the book",
      style: TextStyle(
        color: Colors.black26,
      ),
    );
  }

  _stars() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          for (var i = 0; i < 5; i++)
            Icon(
              Icons.star_sharp,
              color: Color.fromRGBO(255, 110, 161, 1.0),
            ),
        ],
      ),
    );
  }

  _writerNameText() {
    return Text(
      "Writer of the book",
      style: TextStyle(
        color: Colors.black45,
      ),
    );
  }

  _bookNameText(BuildContext context) {
    return Text(
      "Name of the book",
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: Colors.grey[800]),
    );
  }

  _bookContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(imageManager.randomImage), fit: BoxFit.cover),
      ),
    );
  }
}
