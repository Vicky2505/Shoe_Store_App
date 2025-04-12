import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFFFFE),
      body: Center(
        child: Text(
          'My Cart Screen',
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
