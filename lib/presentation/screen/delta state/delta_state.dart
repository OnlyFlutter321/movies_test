import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/assets.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:movies_test/utils/my_const/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/my_const/build_bottom.dart';

class DeltaState extends StatelessWidget {
  const DeltaState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      bottomNavigationBar: const BuildBottom(),
      drawer: const BuildDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Delta State",
              style: GoogleFonts.ptMono(fontSize: 18),
            ),
            5.heightBox,
            const Icon(Icons.keyboard_arrow_down_sharp),
          ],
        ),
        backgroundColor: ColorHelper.splashColor,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: FaIcon(FontAwesomeIcons.barsProgress),
          ),
        ],
      ),
      body: SingleChildScrollView(child: Body(context)),
    );
  }

  Widget Body(BuildContext context) {
    return Column(
      children: [
        30.heightBox,
        Center(
          child: Text(
            "What do you want to \nstart ordering?",
            style: GoogleFonts.ptMono(
              fontSize: 22,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        30.heightBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              color: const Color(0xFFE5F5FE),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Movies",
                      style: GoogleFonts.ptMono(
                        fontSize: 20,
                        color: const Color(0xFF103E7A),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    10.heightBox,
                    Text(
                      "order and book your favorite\nmovies on the go",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.ptMono(fontSize: 16),
                    ),
                    14.heightBox,
                    Image.asset(
                      Assets.shared.hotel2,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        20.heightBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              color: const Color(0xFFE5F5FE),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Foods",
                      style: GoogleFonts.ptMono(
                        fontSize: 20,
                        color: const Color(0xFF103E7A),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    10.heightBox,
                    Text(
                      "Order and book your favorite\nfood on the go",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.ptMono(fontSize: 16),
                    ),
                    14.heightBox,
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVtLJZQDougPu5OSKiOL18nQ1XaYsCqH-bQn_mvXRq-g&s',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        20.heightBox,
      ],
    );
  }
}
