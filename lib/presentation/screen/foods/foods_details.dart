import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/assets.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodsDetails extends StatefulWidget {
  const FoodsDetails({super.key});

  @override
  State<FoodsDetails> createState() => _FoodsDetailsState();
}

class _FoodsDetailsState extends State<FoodsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      appBar: AppBar(
        backgroundColor: ColorHelper.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                Assets.shared.gonda,
                fit: BoxFit.cover,
              ),
            ),
          ),
          25.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Pizza",
                  style: GoogleFonts.ptMono(
                      color: ColorHelper.white, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "N1,900",
                  style: GoogleFonts.ptMono(
                      color: ColorHelper.white, fontSize: 20),
                ),
              ],
            ),
          ),
          30.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              color: ColorHelper.grey.withOpacity(0.4),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  30.widthBox,
                  Text(
                    "Quantity",
                    style: GoogleFonts.ptMono(
                      color: ColorHelper.white,
                    ),
                  ),
                  20.widthBox,
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: ColorHelper.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "+",
                            style: GoogleFonts.ptMono(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          VerticalDivider(
                            color: ColorHelper.grey.withOpacity(0.6),
                          ),
                          Text(
                            "1",
                            style: GoogleFonts.ptMono(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          VerticalDivider(
                            color: ColorHelper.grey.withOpacity(0.6),
                          ),
                          Text(
                            "-",
                            style: GoogleFonts.ptMono(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              "Add to cart",
              style: GoogleFonts.ptMono(
                color: ColorHelper.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
