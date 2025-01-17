import 'package:rent_it_3/models/location_order.dart';
import 'package:rent_it_3/services/location_order_service.dart';

class LocationOrderController {
  final LocationOrderService _locationOrderService = LocationOrderService();

  Future<List<LocationOrder>> getAllLocationOrders() async {
    return await _locationOrderService.fetchAllLocationOrders();
  }

  Future<void> addLocationOrder(LocationOrder locationOrder) async {
    await _locationOrderService.addLocationOrder(locationOrder);
  }

  Future<void> updateLocationOrder(LocationOrder locationOrder) async {
    await _locationOrderService.updateLocationOrder(locationOrder);
  }

  Future<void> deleteLocationOrder(int id) async {
    await _locationOrderService.deleteLocationOrder(id);
  }
}
