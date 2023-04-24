import 'package:flutter/material.dart';
import 'package:latihan_flutter/theme.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruHitam,
        title: Text('About', style: headLandBold.copyWith(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
            )
          ],
        ),
      ),
    );
  }
}