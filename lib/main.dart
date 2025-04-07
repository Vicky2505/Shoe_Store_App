import 'package:flutter/material.dart';
import 'package:sneakers/screens/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
