import 'package:cloud_firestore/cloud_firestore.dart';

class Apartment {
  final String id;
  final String name;
  final String location;
  final double price;

  Apartment({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
  });

  factory Apartment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Apartment(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
    );
  }
}
