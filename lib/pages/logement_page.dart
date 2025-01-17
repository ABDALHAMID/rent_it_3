import 'package:flutter/material.dart';
import 'package:rent_it_3/models/logement.dart';
import 'package:rent_it_3/controllers/logement_controller.dart';
import 'package:rent_it_3/widgets/custom_carousel.dart';
import 'package:rent_it_3/models/logement_image.dart';

class LogementPage extends StatelessWidget {
  final Logement logement;

  LogementPage({required this.logement});

  Future<List<String>> getLogementImages(int logementId) async {
    final LogementController logementController = LogementController();
    List<LogementImage> logementImages = await logementController.getLogementImages(logementId);
    return logementImages.map((image) => image.imagePath ?? 'assets/default_image.png').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(logement.name)),
      body: FutureBuilder<List<String>>(
        future: getLogementImages(int.parse(logement.id!)), // Ensure id is passed correctly as int
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching images'));
          } else {
            return Column(
              children: [
                CustomCarousel(imagePaths: snapshot.data ?? ['assets/default_image.png']), // Use a default image if data is null
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(logement.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Text("Adresse: ${logement.adresse}"),
                      Text("Prix: \$${logement.prix.toStringAsFixed(2)}"),
                      Text("Description: ${logement.description}"),
                      // Add more logement details as necessary
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press based on logement status
        },
        child: Icon(
          logement.status == 'available' ? Icons.check : Icons.warning,
        ),
      ),
    );
  }
}
