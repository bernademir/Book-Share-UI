import 'package:bookshareui/model/image_manager.dart';
import 'package:bookshareui/widget/float_app_bar.dart';
import 'package:flutter/material.dart';

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

  String pinkButtonText = "Add to cart";
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
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(imageManager.randomImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name of the book",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.grey[800]),
                        ),
                        Text(
                          "Writer of the book",
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Icon(
                                  Icons.star_sharp,
                                  color: Color.fromRGBO(255, 110, 161, 1.0),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          "Content of the book",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 15,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 110, 161, 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    pinkButtonText,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Container(
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
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    whiteButtonText,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
