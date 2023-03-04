import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui' as ui;
import '../../../utils/my_const/assets.dart';

class BookingSeats extends StatelessWidget {
  const BookingSeats({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.splashColor,
        body: Stack(
          children: [
            Column(
              children: [
                50.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: ColorHelper.white,
                      size: 20,
                    ),
                    20.widthBox,
                    const Text(
                      "Delat Mall Cinema",
                      style: TextStyle(
                        color: ColorHelper.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                10.heightBox,
                CustomPaint(
                  size: Size(
                      1000,
                      (150 * 0.5833333333333334)
                          .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      color: const Color(0xFF38354B),
                    ),
                    5.widthBox,
                    Text(
                      "Unavailable",
                      style: GoogleFonts.ptMono(
                        color: Colors.white,
                      ),
                    ),
                    20.widthBox,
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.red.withOpacity(0.8),
                    ),
                    5.widthBox,
                    Text(
                      "Selected",
                      style: GoogleFonts.ptMono(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 8,
                                  ),
                                  itemCount: 60,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => {},
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38,
                                        ),
                                        color: index % 3 == 0
                                            ? const Color(0xFF38354B)
                                            : ColorHelper.red.withOpacity(0.5),
                                      ),
                                      child: ListView(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 3),
                                            child: Text(
                                              "${index + 1}",
                                              style: GoogleFonts.ptMono(
                                                color: const Color(0xFFAFAEB7),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                Text(
                  "Date",
                  style: GoogleFonts.ptMono(
                    color: ColorHelper.grey,
                  ),
                ),
                5.heightBox,
                Text(
                  "20 Nov",
                  style: GoogleFonts.ptMono(
                    color: ColorHelper.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Book Ticket",
                    style: GoogleFonts.ptMono(
                      color: ColorHelper.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Book Ticket",
                    style: GoogleFonts.ptMono(
                      color: ColorHelper.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 241, 72, 21)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.17;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4991667, size.height * 0.6428571);
    path0.lineTo(size.width * 0.4583333, size.height * 0.5700000);
    path0.lineTo(size.width * 0.4575000, size.height * 0.4271429);
    path0.lineTo(size.width * 0.5408333, size.height * 0.4242857);
    path0.lineTo(size.width * 0.5408333, size.height * 0.5700000);
    path0.lineTo(size.width * 0.4991667, size.height * 0.6428571);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
