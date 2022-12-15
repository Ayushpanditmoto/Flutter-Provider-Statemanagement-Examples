// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanage/Provider/FavouriteProvider.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProv = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: ListView.builder(
          itemCount: favouriteProv.favouriteList.length,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, value, child) => ListTile(
                      title: Text('Item ${favouriteProv.favouriteList[index]}'),
                      trailing: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            favouriteProv.removeFavourite(
                                favouriteProv.favouriteList[index]);
                          }),
                    ));
          }),
    );
  }
}
