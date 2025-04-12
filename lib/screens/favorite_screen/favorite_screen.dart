import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFEFFFFE),
      body: Center(
        child: Text(
          'Favorite Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}