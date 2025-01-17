import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/logement_controller.dart';
import 'package:rent_it_3/widgets/logement_card.dart';
import 'package:rent_it_3/models/logement.dart';

import '../widgets/custom_carousel.dart';

class HomeLogement extends StatefulWidget {
  @override
  _HomeLogementState createState() => _HomeLogementState();
}

class _HomeLogementState extends State<HomeLogement> {
  late Future<List<Logement>> logements;
  final LogementController _logementController = LogementController();

  @override
  void initState() {
    super.initState();
    logements = _logementController.getAllLogements();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Logement>>(
          future: logements,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final logement = snapshot.data![index];
                  return Column(
                      children: [
                      CustomCarousel(imagePaths: [
                      'assets/intosection/Agadir.jpg',
                      'assets/intosection/Essaouira.jpg',
                      'assets/intosection/Marrakech.jpg',
                      'assets/intosection/Rabat.jpg',
                      ]),
                    LogementCard(logement: logement)// Use HomeLogement directly
                  ]);
                },
              );
            }
          },
        ),
      ],
    );
  }
}
