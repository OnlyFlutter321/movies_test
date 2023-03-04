import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/my_const/assets.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1A29),
      appBar: AppBar(
        backgroundColor: ColorHelper.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Order Summary",
          style: GoogleFonts.ptMono(
            color: ColorHelper.grey,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                /*      alignment: Alignment.centerLeft, */
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff38354B),
                        borderRadius: BorderRadius.circular(10)),
                    height: 600,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: -30,
                    top: 170,
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: Color(0xff1C1A29),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: 170,
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Color(0xff1C1A29)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.39,
                              width: MediaQuery.of(context).size.width * 0.39,
                              child: Image.asset(
                                Assets.shared.spiderMan,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.widthBox,
                            Column(
                              children: [
                                Text(
                                  "Spiderman Homecoming",
                                  style: GoogleFonts.padauk(
                                    color: ColorHelper.white,
                                    fontSize: 16,
                                  ),
                                ),
                                20.heightBox,
                                Text(
                                  "Delat Mall Cinema",
                                  style: GoogleFonts.padauk(
                                    color: ColorHelper.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Wednesday, 20 Nov 2019,",
                                  style: GoogleFonts.padauk(
                                    color: ColorHelper.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "15:05",
                                  style: GoogleFonts.padauk(
                                    color: ColorHelper.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        80.heightBox,
                      ],
                    ),
                  ),
                  Positioned(
                    top: 230,
                    left: 30,
                    child: Column(
                      children: [
                        buildText(context, name: 'Order Number'),
                        buildTextNo(context, no: '1198804794001625088'),
                        15.heightBox,
                        buildText(context, name: 'Seat'),
                        buildTextNo(context, no: 'G10, G11'),
                        15.heightBox,
                        buildText(context, name: 'Payment Method'),
                        buildTextNo(context, no: 'Cash'),
                        15.heightBox,
                        buildText(context, name: 'Regular Seat'),
                        buildTextNo(context, no: 'N30492 x2'),
                        50.heightBox,
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Total',
                            style: GoogleFonts.padauk(
                              color: ColorHelper.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        10.heightBox,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.99,
                          child: Text(
                            'N1400.00',
                            style: GoogleFonts.padauk(
                              color: ColorHelper.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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

  SizedBox buildTextNo(BuildContext context, {required String no}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        no,
        style: GoogleFonts.padauk(
          color: ColorHelper.white,
          fontSize: 18,
        ),
      ),
    );
  }

  SizedBox buildText(BuildContext context, {required String name}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        name,
        style: GoogleFonts.padauk(
          color: ColorHelper.grey,
          fontSize: 15,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
