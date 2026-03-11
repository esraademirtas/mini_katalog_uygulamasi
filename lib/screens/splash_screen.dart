import 'dart:async';
import 'package:flutter/material.dart';
import 'inventory_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 saniye bekle ve sonra ana sayfaya (InventoryScreen) geç
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InventoryScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text(
              "🎮",
              style: TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 20),
            const Text(
              "TNC TECH CATALOG",
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Digital Inventory",
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const SizedBox(height: 50),
            
            const CircularProgressIndicator(
              color: Colors.cyanAccent,
            ),
          ],
        ),
      ),
    );
  }
}