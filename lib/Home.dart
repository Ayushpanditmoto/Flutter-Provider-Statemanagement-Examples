// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/ThemeProvider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
        actions: [
          ActionChip(
              label: themeProvider.themeMode == ThemeMode.light
                  ? const Text('Light')
                  : const Text('Dark'),
              onPressed: () {
                if (themeProvider.themeMode == ThemeMode.light) {
                  themeProvider.setThemeMode(ThemeMode.dark);
                } else {
                  themeProvider.setThemeMode(ThemeMode.light);
                }
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                child: const Text("Counter")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/slider');
                },
                child: const Text("Slider")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fav');
                },
                child: const Text("Favourite")),
          ],
        ),
      ),
    );
  }
}
