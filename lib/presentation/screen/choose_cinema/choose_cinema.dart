import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/presentation/screen/home_screen/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/my_const/build_container.dart';
import '../../../utils/my_const/color.dart';
import '../../../utils/my_const/rounded_button.dart';

class ChooseCinema extends StatelessWidget {
  const ChooseCinema({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Choose Cinemas near you.",
                style: GoogleFonts.ptMono(
                  color: ColorHelper.white,
                  fontSize: 24,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "According to your location these are the",
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            8.heightBox,
            Text(
              "nearest genesis cinemas located near you",
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
                fontSize: 12,
              ),
            ),
            50.heightBox,
            buildContainer(
              onPress: () {},
              text: "Shoprite genesis cinema",
            ),
            buildContainer(
              onPress: () {},
              text: "Warri port gensis",
            ),
            buildContainer(
              onPress: () {},
              text: "Refinery junction",
            ),
            buildContainer(
              onPress: () {},
              text: "Enugu genesis cinema",
            ),
            buildContainer(
              onPress: () {},
              text: "Shoprite genesis cinema",
            ),
            buildContainer(
              onPress: () {},
              text: "Warri port gensis",
            ),
            buildContainer(
              onPress: () {},
              text: "Refinery junction",
            ),
            80.heightBox,
            RoundedButton(
                text: "Get Started",
                backgroundColor: ColorHelper.red,
                foregroundColor: ColorHelper.white,
                onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                }),
            40.heightBox,
          ],
        ),
      ),
    );
  }
}
