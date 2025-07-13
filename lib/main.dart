import 'package:drinks_app/core/Utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DrinksApp());
}

class DrinksApp extends StatelessWidget {
  const DrinksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: AppRouter.router,
      title: 'Drinks App',

      debugShowCheckedModeBanner: false,
    );
  }
}
