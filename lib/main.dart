import 'package:flutter/material.dart';
import 'package:url_shortner/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortner',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  MainPage(),
    );
  }
}


