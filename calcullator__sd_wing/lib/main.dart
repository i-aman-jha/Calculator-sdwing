import 'package:calcullator__sd_wing/pages/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:const Homepage(),
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 234, 234, 234),appBarTheme: const AppBarTheme(color: Colors.transparent)),
    );
  }
}