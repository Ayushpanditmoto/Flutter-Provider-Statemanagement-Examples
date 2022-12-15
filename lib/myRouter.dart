// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:schoolmanage/Pages/Counter.dart';
import 'package:schoolmanage/Pages/Favourite.dart';
import 'package:schoolmanage/Pages/FavouriteItem.dart';

import 'Home.dart';
import 'Pages/Slider.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/counter':
        return MaterialPageRoute(builder: (_) => const Counter());
      case '/slider':
        return MaterialPageRoute(builder: (_) => const SliderPage());
      case '/fav':
        return MaterialPageRoute(builder: (_) => const Favourite());
      case '/favouriteItem':
        return MaterialPageRoute(builder: (_) => const FavouriteItem());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
