import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_it_3/models/location_order.dart';

class LocationOrderService {
  final CollectionReference locationOrdersCollection = FirebaseFirestore.instance.collection('location_orders');

  Future<List<LocationOrder>> fetchAllLocationOrders() async {
    try {
      QuerySnapshot querySnapshot = await locationOrdersCollection.get();
      return querySnapshot.docs.map((doc) => LocationOrder.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Failed to load location orders");
    }
  }

  Future<void> addLocationOrder(LocationOrder locationOrder) async {
    await locationOrdersCollection.add(locationOrder.toMap());
  }

  Future<void> updateLocationOrder(LocationOrder locationOrder) async {
    await locationOrdersCollection.doc(locationOrder.id.toString()).update(locationOrder.toMap());
  }

  Future<void> deleteLocationOrder(int id) async {
    await locationOrdersCollection.doc(id.toString()).delete();
  }
}
