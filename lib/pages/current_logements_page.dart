import 'package:flutter/material.dart';
import 'package:rent_it_3/controllers/logement_controller.dart';
import 'package:rent_it_3/models/logement.dart';

class CurrentLogementsPage extends StatelessWidget {
  final LogementController _logementController = LogementController();

  Future<List<Logement>> _getLogements() async {
    return await _logementController.getAllLogements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Logements')),
      body: FutureBuilder<List<Logement>>(
        future: _getLogements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load logements.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No logements available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final logement = snapshot.data![index];
                return ListTile(
                  title: Text(logement.name),
                  subtitle: Text('Price: \$${logement.prix.toStringAsFixed(2)}'),
                  onTap: () {
                    // Navigate to logement details page
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
