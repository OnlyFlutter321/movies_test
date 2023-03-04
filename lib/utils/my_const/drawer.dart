import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screen/under_development/under_development.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: ColorHelper.splashColor,
              ),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.movie_outlined,
                        size: 94,
                        color: ColorHelper.white,
                      ),
                    ),
                    10.heightBox,
                    Center(
                      child: Text(
                        "Ali",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _commonMethod("assets/images/9.jpg", "Home", [
              _commonListTile("Home", const UnderDevelopment()),
              _commonListTile("Home Import Status", const UnderDevelopment()),
              _commonListTile("Attributes", const UnderDevelopment()),
            ]),
            _commonMethod("assets/images/3.jpg", "Delta State", [
              _commonListTile("Delta", const UnderDevelopment()),
            ]),
            _commonMethod("assets/images/6.jpg", "Movies", [
              _commonListTile("Movies", const UnderDevelopment()),
              _commonListTile("Movies List", const UnderDevelopment()),
            ]),
            _commonMethod("assets/images/7.jpg", "Foods", [
              _commonListTile("Foods", const UnderDevelopment()),
            ]),
          ],
        ),
      ),
    );
  }
}

Widget _commonListTile(String name, Widget navPage) => ListTile(
      title: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: ColorHelper.primaryTextColor,
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        // Get.to(() => navPage);
      },
    );

Widget _commonMethod(String imgPath, String name, List<Widget> listOfWidget) =>
    ExpansionTile(
      leading: Image.asset(
        imgPath,
        height: 38,
        fit: BoxFit.fitWidth,
      ),
      title: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: ColorHelper.primaryTextColor,
            fontSize: 17,
          ),
        ),
      ),
      children: listOfWidget,
    );
