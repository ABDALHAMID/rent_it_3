import 'package:flutter/material.dart';
import 'package:rent_it_3/widgets/bottom_navbar.dart';
import 'package:rent_it_3/widgets/home_header.dart';
import 'package:rent_it_3/widgets/custom_carousel.dart';
import 'package:rent_it_3/pages/home_logement.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: SingleChildScrollView(
        child: HomeLogement()
      ),
      bottomNavigationBar: BottomNavbar(), // Use existing BottomNavbar
    );
  }
}
