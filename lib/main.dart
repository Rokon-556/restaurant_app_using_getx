import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food/recommeded_food_details.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecommendedFoodDetails(),
      // home: const PopularFoodDetail(),
      // home: const MainFoodPage(),
    );
  }
}


