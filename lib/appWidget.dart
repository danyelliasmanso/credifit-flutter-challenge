import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/home/homeScreen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        backgroundColor: Colors.grey[300]
      ),
      );
      
    
  }
}