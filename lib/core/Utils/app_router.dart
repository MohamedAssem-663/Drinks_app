import 'package:drinks_app/screens/home/home.dart';
import 'package:drinks_app/screens/splash/splash.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHome = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splash()),
      GoRoute(path: kHome, builder: (context, state) => const Home()),
    ],
  );
}
