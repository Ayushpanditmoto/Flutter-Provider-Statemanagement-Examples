// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanage/Provider/FavouriteProvider.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Favourite build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        actions: [
          IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushNamed(context, '/favouriteItem');
              })
        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, FavouriteProvider favouriteProv, child) {
              return ListTile(
                title: Text('Item $index'),
                trailing: IconButton(
                    icon: Icon(
                      favouriteProv.favouriteList.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favouriteProv.favouriteList.contains(index)) {
                        favouriteProv.removeFavourite(index);
                      } else {
                        favouriteProv.addFavourite(index);
                      }
                    }),
              );
            });
          }),
    );
  }
}
