import 'dart:async';

import 'package:drinks_app/componants/card_widget.dart';
import 'package:drinks_app/models/drink_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double _scale = 1.0;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scale != 0.95) {
      setState(() {
        _scale = 0.95;
      });
    }

    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 50), () {
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

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
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: ListView.builder(
                  controller: _scrollController,
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
            ),
          ],
        ),
      ),
    );
  }
}
