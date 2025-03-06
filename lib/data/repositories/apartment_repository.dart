import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes/data/models/apartment.dart';

class ApartmentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Apartment>> getApartments() {
    return _firestore.collection('apartments').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Apartment.fromFirestore(doc)).toList();
    });
  }

  Stream<List<Apartment>> searchApartments(String query) {
    return _firestore
        .collection('apartments')
        .where('name', isGreaterThanOrEqualTo: query)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Apartment.fromFirestore(doc)).toList();
    });
  }
}
