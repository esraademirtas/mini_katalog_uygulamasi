// tech_item.dart JSON desteği 
import 'package:flutter/material.dart';

class TechItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String ikon;
  final Color temaRengi;

  TechItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ikon,
    required this.temaRengi,
  });

  // Raporda istenen JSON simülasyon
  factory TechItem.fromJson(Map<String, dynamic> json) {
    return TechItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      ikon: json['ikon'],
      temaRengi: Color(int.parse(json['temaRengi'])),
    );
  }
}