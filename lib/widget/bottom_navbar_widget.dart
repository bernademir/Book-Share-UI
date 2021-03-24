import 'package:bookshareui/view/discover_view.dart';
import 'package:bookshareui/view/library_view.dart';
import 'package:bookshareui/view/profile_view.dart';
import 'package:bookshareui/view/store_view.dart';
import 'package:bookshareui/view/wishlist_view.dart';
import 'package:flutter/material.dart';

class MyCustomNavBar extends StatefulWidget {
  @override
  _MyCustomNavBarState createState() => _MyCustomNavBarState();
}

class _MyCustomNavBarState extends State<MyCustomNavBar> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromRGBO(255, 110, 161, 1.0),
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5),
    );
  }

  Widget _bodyPage() {
    if (_selectedIndex == 0)
      return DiscoverView();
    else if (_selectedIndex == 1)
      return LibraryView();
    else if (_selectedIndex == 2)
      return WishlistView();
    else if (_selectedIndex == 3)
      return StoreView();
    else if (_selectedIndex == 4) return ProfileView();
    return Container();
  }
}
