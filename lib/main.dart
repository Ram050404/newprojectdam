
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:newproject/GetStartedPage.dart';
import 'package:newproject/categories/Grills.dart';
import 'package:newproject/home/HomePage.dart';
import 'package:newproject/home/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'home/FavoritesProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' daw project ',
      theme: ThemeData(

        // primarySwatch: Colors.amber,
        //   scaffoldBackgroundColor: Colors.lime[50],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: GetStartedPage(),

    );
  }
}
