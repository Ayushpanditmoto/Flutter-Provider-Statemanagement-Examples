import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schoolmanage/Provider/CounterProvider.dart';
import 'package:schoolmanage/Provider/FavouriteProvider.dart';
import 'package:schoolmanage/Provider/SliderProvider.dart';
import 'package:schoolmanage/Provider/ThemeProvider.dart';
import 'package:schoolmanage/myRouter.dart';

import 'Home.dart';
import 'Provider/authProvider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp build');
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider Demo',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                color: Colors.purple,
              ),
            ),
            home: const Home(),
            initialRoute: "/",
            onGenerateRoute: MyRouter.generateRoute,
          );
        }));
  }
}
