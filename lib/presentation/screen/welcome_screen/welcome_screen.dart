import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies_test/presentation/screen/login/login_screen.dart';
import '../../../business_logic/login_bloc/login_bloc.dart';
import '../../../utils/my_const/assets.dart';
import '../../../utils/my_const/color.dart';
import '../../rotutes/router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelper.splashColor,
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              // title: 'ss',
              titleWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Never miss the latest movie on a go.",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "The genesis cinema is a correct guy and Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia h",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildImage(Assets.shared.hotel),
              ),
              decoration: getPageDdecoration(),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Buy foods before watching movies",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "The genesis cinema is a correct guy and Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia h",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildImage(Assets.shared.newdelhi),
              ),
              decoration: getPageDdecoration(),
            ),
            PageViewModel(
              titleWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Receive notifications instantly",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "The genesis cinema is a correct guy and Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia h",
                        style: GoogleFonts.ptMono(
                          color: ColorHelper.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildImage(
                  Assets.shared.newyork,
                ),
              ),
              decoration: getPageDdecoration(),
            ),
          ],
          onSkip: () {},
          showNextButton: false,
          animationDuration: 1000,
          globalBackgroundColor: ColorHelper.splashColor,
          done: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Text(
              "Get Started",
              style: GoogleFonts.ptMono(
                fontSize: 12,
                color: ColorHelper.white,
              ),
            ),
          ),
          next: const Icon(Icons.arrow_forward),
          onDone: () {
            Navigator.pushNamed(context, AppRouter.LOGIN);
          },
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: GoogleFonts.ptMono(
              fontSize: 12,
              color: ColorHelper.white,
            ),
          ),
          dotsDecorator: getDotDecoraion(),
        ),
      ),
    );
  }

  PageDecoration getPageDdecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: ColorHelper.splashColor,
      );

  DotsDecorator getDotDecoraion() {
    return DotsDecorator(
      color: ColorHelper.grey,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeColor: ColorHelper.orange,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  Widget buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
