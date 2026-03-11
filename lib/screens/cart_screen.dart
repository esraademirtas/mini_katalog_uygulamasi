import 'package:flutter/material.dart';
import '../data/inventory_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double total = myCart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text("My Cart", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: myCart.isEmpty
          ? const Center(child: Text("Your cart is empty", style: TextStyle(color: Colors.grey)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myCart.length,
                    itemBuilder: (context, index) {
                      final item = myCart[index];
                      return ListTile(
                        leading: Image.asset(item.ikon, width: 50),
                        title: Text(item.name, style: const TextStyle(color: Colors.white)),
                        subtitle: Text("${item.price} TL", style: TextStyle(color: item.temaRengi)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                          onPressed: () {
                      
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(color: Colors.grey[900], borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total: $total TL", style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                        child: const Text("Checkout", style: TextStyle(color: Colors.black)),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}