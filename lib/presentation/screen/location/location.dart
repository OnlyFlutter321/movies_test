import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/presentation/screen/choose_cinema/choose_cinema.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/my_const/build_textfiled.dart';
import '../../../utils/my_const/color.dart';
import '../../../utils/my_const/rounded_button.dart';

class Location extends StatelessWidget {
  const Location({super.key});

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
                "Whats your Location",
                style: GoogleFonts.ptMono(
                  color: ColorHelper.white,
                  fontSize: 28,
                ),
              ),
            ),
            20.heightBox,
            Text(
              "we need to know your location so that we could",
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            8.heightBox,
            Text(
              "filter and show you available cinemas around you.",
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
                fontSize: 12,
              ),
            ),
            50.heightBox,
            buildTextfiled(
              tx: locationController,
              backgroundColor: const Color(0xFF3D3D3D),
              color: ColorHelper.white,
              label: 'Enter current locatiion',
            ),
            24.heightBox,
            Text(
              "Or",
              style: GoogleFonts.ptMono(
                color: ColorHelper.grey,
              ),
            ),
            40.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.paperPlane,
                  color: Colors.white,
                ),
                15.widthBox,
                Container(
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white, // Text colour here
                        width: 1.0, // Underline width
                      ),
                    ),
                  ),
                  child: const Text(
                    "Use current location",
                    style: TextStyle(
                      color: Colors.white, // Text colour here
                    ),
                  ),
                ),
              ],
            ),
            100.heightBox,
            RoundedButton(
                text: "Next",
                backgroundColor: ColorHelper.red,
                foregroundColor: ColorHelper.white,
                onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChooseCinema()));
                }),
          ],
        ),
      ),
    );
  }
}
