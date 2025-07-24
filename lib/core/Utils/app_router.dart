import 'package:drinks_app/screens/home/drinks_details/drink_details.dart';
import 'package:drinks_app/screens/home/home.dart';
import 'package:drinks_app/screens/splash/splash.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHome = '/home';
  static const String kDrinkDetails = '/drinkDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splash()),
      GoRoute(path: kHome, builder: (context, state) => const Home()),
      GoRoute(
        path: kDrinkDetails,
        builder: (context, state) => const DrinkDetails(),
      ),
    ],
  );
}
