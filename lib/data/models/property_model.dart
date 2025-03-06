import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String location;
  final double price;
  final int beds;
  final int bathrooms;

  const Property({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.beds,
    required this.bathrooms,
  });

  factory Property.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Property(
      id: documentId,
      title: data['title'] ?? '',
      imageUrl: data['image'] ?? '',
      location: data['location'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      beds: data['beds'] ?? 0,
      bathrooms: data['bathrooms'] ?? 0,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, imageUrl, location, price, beds, bathrooms];
}
