import 'package:flutter/material.dart';
import '../models/tech_item.dart';
import '../data/inventory_data.dart'; // Sepet listesine ulaşmak için ekledim

class DetailsScreen extends StatelessWidget {
  final TechItem item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Ürün Resmi
            Hero(
              tag: item.id,
              child: Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Image.asset(item.ikon, fit: BoxFit.contain),
              ),
            ),

            // 2. Ürün Bilgileri Paneli
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: item.temaRengi.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "PREMIUM TECH",
                      style: TextStyle(color: item.temaRengi, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Text(
                        "${item.price.toStringAsFixed(0)} TL",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: item.temaRengi),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  
                  // SEPETE EKLE BUTONU
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Ürünü sepet listesine ekliyoruz
                        myCart.add(item); 
                        
                        // Kullanıcıya bir bildirim gösteriyoruz
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${item.name} eklendi!"),
                            backgroundColor: item.temaRengi,
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: item.temaRengi,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}