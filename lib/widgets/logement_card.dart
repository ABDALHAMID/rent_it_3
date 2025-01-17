import 'package:flutter/material.dart';
import 'package:rent_it_3/models/logement.dart';
import 'package:rent_it_3/pages/logement_page.dart'; // Ensure this import exists

class LogementCard extends StatelessWidget {
  final Logement logement;

  LogementCard({required this.logement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            // Load the image from Firebase Storage URL
            SizedBox(
              height: 200.0,
              child: logement.imagePath != null ?
              Image.network(
                logement.imagePath!,
                fit: BoxFit.cover,
              ) : Image.asset('assets/default_image.png'), // Fallback image
            ),
            ListTile(
              title: Text(logement.name),
              subtitle: Text('Price: \$${logement.prix.toStringAsFixed(2)}\nAddress: ${logement.adresse}'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogementPage(logement: logement),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
