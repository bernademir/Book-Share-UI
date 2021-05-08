import 'package:flutter/material.dart';

class Lists {
  List welcomeViewTitles = [
    'Culture',
    'Design',
    'Food',
    'History',
    'Law',
    'Medical',
    'Politics',
    'Science',
    'Sport'
  ];

  List welcomeViewImages = [
    'assets/topics/culture.jpg',
    'assets/topics/design.jpg',
    'assets/topics/food.jpg',
    'assets/topics/history.jpg',
    'assets/topics/law.jpg',
    'assets/topics/medical.jpg',
    'assets/topics/politics.jpg',
    'assets/topics/science.jpg',
    'assets/topics/sport.jpg'
  ];

  List<String> profileAccount = ["My  Cart", "Purchases", "Account"];
  List<IconData> accountIcons = [
    Icons.shopping_cart,
    Icons.account_balance_wallet,
    Icons.account_box_rounded
  ];
  List<String> profileSettings = [
    "Night Mode",
    "Notification",
    "Language",
    "Help",
    "Sign Out"
  ];
  List<IconData> settingsIcons = [
    Icons.nightlight_round,
    Icons.notifications,
    Icons.language,
    Icons.help,
    Icons.exit_to_app
  ];
  String profileAvatar = 'assets/profile/avatar.png';

  List profileNumbers = ["21", "50k", "30"];

  List profileSubtitles = ["Books", "Followers", "Following"];

  List profileHeadlines = ["Account", "Settings"];

  List discoverTitles = [
    "Our Top Picks",
    "Trending Books",
    "Best Share",
    "Recently Viewed"
  ];

  List libraryHeadlines = ["General", "New", "Most Viewed"];
}
