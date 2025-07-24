import 'package:drinks_app/componants/card_widget.dart';
import 'package:drinks_app/core/Utils/app_router.dart';
import 'package:drinks_app/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext contedxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (constext, index) {
                  final drink = DrinkModel.drinks[index];
                  return AnimatedBuilder(
                    animation: _scrollController,
                    builder: (context, child) {
                      double offset = 0;
                      if (_scrollController.hasClients) {
                        offset = _scrollController.offset / 100 - index;
                      }
                      offset = offset.clamp(0, 0.5);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: child,
                      );
                    },
                    child: GestureDetector(
                      child: CardWidget(drinkModel: drink),
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDrinkDetails);
                      },
                    ),
                  );
                },
                itemCount: DrinkModel.drinks.length,

                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
