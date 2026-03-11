import 'package:flutter/material.dart';
import 'package:tech_inventory_app/screens/splash_screen.dart'; 

void main() => runApp(const TechInventoryApp());

class TechInventoryApp extends StatelessWidget {
  const TechInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TNC TECH CATALOG',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.cyan,
        brightness: Brightness.dark,
      ),
      
      home: const SplashScreen(), 
    );
  }
}