import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/category_model.dart';
import '../model/image_manager.dart';
import '../widget/clipper_widget.dart';
import '../widget/float_app_bar.dart';

class DiscoverView extends StatefulWidget {
  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  late final ImageManager imageManager;

  Category _category = Category();

  @override
  void initState() {
    imageManager = ImageManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List texts = [
      "Our Top Picks",
      "Trending Books",
      "Best Share",
      "Recently Viewed"
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: FloatAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _clipPath1(context),
                _clipPath2(context),
                _stackTitle(context, texts[0]),
                _listCardPositioned(context),
              ],
            ),
            _rowCategoryScroll(),
            SizedBox(height: 20.0),
            _headlines(texts, context, 1),
            _trendBooksGrid(context),
            _headlines(texts, context, 2),
            _bestShareRowScroll(),
            _headlines(texts, context, 3),
            _bestShareRowScroll(),
          ],
        ),
      ),
    );
  }

  _bestShareRowScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 3; i++) _bestShareRow(i),
        ],
      ),
    );
  }

  _bestShareRow(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            padding: EdgeInsets.all(35.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageManager.randomImage),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Book Name",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Book Writer",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  _trendBooksGrid(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 100,
      child: GridView.count(
        padding: EdgeInsets.only(top: 0),
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.65,
        crossAxisCount: 3,
        children: [
          for (var i = 0; i < 6; i++) _listCard(i),
        ],
      ),
    );
  }

  _headlines(List<dynamic> texts, BuildContext context, int i) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          texts[i],
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  _rowCategoryScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [for (int i = 0; i < 9; i++) _rowCategory(i)],
      ),
    );
  }

  _rowCategory(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(35.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(_category.images[i]),
                  fit: BoxFit.cover,
                  alignment: Alignment.center),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(_category.titles[i]),
        ),
      ],
    );
  }

  _listCard(int i) {
    return InkWell(
      onTap: () {},
      child: Card(
        semanticContainer: true,
        child: Image.network(
          imageManager.randomImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _listCardPositioned(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4 - 30,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4 - 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 6; i++) _listCard(i),
            ],
          ),
        ),
      ),
    );
  }

  _stackTitle(BuildContext context, String titleStack) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4 - 70,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          titleStack,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  _clipPath2(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper2(),
      child: Container(
        color: Colors.white24,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2 - 20,
      ),
    );
  }

  _clipPath1(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper1(),
      child: Container(
        color: Color.fromRGBO(255, 110, 161, 1.0), //#FF6EA1
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
