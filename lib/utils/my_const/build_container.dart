import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/color.dart';

class buildContainer extends StatelessWidget {
  VoidCallback onPress;
  String text;
  buildContainer({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
            color: ColorHelper.containerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
