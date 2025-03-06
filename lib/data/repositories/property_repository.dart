import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes/data/models/property_model.dart';

class PropertyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Property>> getProperties() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('properties').get();

      return querySnapshot.docs.map((doc) {
        return Property.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching properties: $e');
      return [];
    }
  }
}
