import 'package:rent_it_3/models/logement.dart';
import 'package:rent_it_3/models/logement_image.dart';
import 'package:rent_it_3/services/logement_service.dart';
import 'package:rent_it_3/services/logement_image_service.dart';
import 'dart:io';

class LogementController {
  final LogementService _logementService = LogementService();
  final LogementImageService _logementImageService = LogementImageService();

  Future<List<Logement>> getAllLogements() async {
    return await _logementService.fetchAllLogements();
  }

  Future<void> insertLogement(Logement logement, File imageFile) async {
    await _logementService.addLogement(logement, imageFile);
  }

  // Update the signature to accept the named parameter 'imageFile'
  Future<void> updateLogement(Logement logement, {File? imageFile}) async {
    await _logementService.updateLogement(logement, imageFile: imageFile);
  }

  Future<void> deleteLogement(int id) async {
    await _logementService.deleteLogement(id);
  }

  Future<List<LogementImage>> getLogementImages(int logementId) async {
    return await _logementImageService.fetchImagesForLogement(logementId);
  }
}
