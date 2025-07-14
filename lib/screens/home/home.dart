import 'package:drinks_app/componants/card_widget.dart';
import 'package:drinks_app/models/drink_model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
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
                itemBuilder: (constext, index) {
                  final drink = DrinkModel.drinks[index];
                  return CardWidget(drinkModel: drink);
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
