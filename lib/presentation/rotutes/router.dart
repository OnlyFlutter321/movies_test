import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/presentation/screen/foods/foods.dart';
import 'package:movies_test/presentation/screen/foods/foods_details.dart';
import 'package:movies_test/presentation/screen/movies_details.dart/movies_details.dart';
import 'package:movies_test/presentation/screen/order/order_summery.dart';
import 'package:movies_test/presentation/screen/booking/booking_seat.dart';
import 'package:movies_test/presentation/screen/delta%20state/delta_state.dart';
import 'package:movies_test/presentation/screen/home_screen/home_screen.dart';
import 'package:movies_test/presentation/screen/location/location.dart';
import 'package:movies_test/presentation/screen/login/login_screen.dart';
import 'package:movies_test/presentation/screen/splash_screen/splash_screen.dart';
import 'package:movies_test/presentation/screen/welcome_screen/welcome_screen.dart';

import '../../business_logic/login_bloc/login_bloc.dart';
import '../screen/signup_screen/signup_screen.dart';

class AppRouter {
  static const String HOME = '/home';
  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String LOCAION = '/location';
  static const String WELCOME = '/welcome';
  static const String DELTA = '/delta';
  static const String MOVIES_DETAILS = '/movies_details';

  static const String SHOW_INFO = '/show_info';
  static const String BOOK_TIME_SLOT = '/book_time_slot';
  static const String BOOK_SEAT_TYPE = '/book_seat_type';
  static const String BOOK_SEAT_SLOT = '/book_seat_slot';
  static const String LIST_ALL_CINE = '/list_all_cine';
  static const String BOOKINGSEATS = '/booking';
  static const String ORDERSUMMERY = '/ordersummery';
  static const String FOODS = '/foods';
  static const String FOODSDETAILS = '/foods_details';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LOGIN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(userRepository: null),
            child: const LoginScreen(),
          ),
        );
      case WELCOME:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case LOCAION:
        return MaterialPageRoute(builder: (_) => const Location());
      case DELTA:
        return MaterialPageRoute(builder: (_) => const DeltaState());
      case MOVIES_DETAILS:
        return MaterialPageRoute(builder: (_) => const MoviesDetails());
      case BOOKINGSEATS:
        return MaterialPageRoute(builder: (_) => const BookingSeats());
      case ORDERSUMMERY:
        return MaterialPageRoute(builder: (_) => const OrderSummery());
      case FOODS:
        return MaterialPageRoute(builder: (_) => const Foods());
      case FOODSDETAILS:
        return MaterialPageRoute(builder: (_) => const FoodsDetails());

      //BookingSeats
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
