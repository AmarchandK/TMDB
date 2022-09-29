import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tmdb/home_page.dart';
import 'package:tmdb/text.dart';

void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
      themeMode: ThemeMode.dark,
    );
  }
}
