import 'package:drinks_app/componants/quntity_widget.dart';
import 'package:drinks_app/componants/toggle_widget.dart';
import 'package:drinks_app/models/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});
  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _pageController = PageController(viewportFraction: 0.50);

  double _currentPage = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 1;
      });
    });
    super.initState();
  }

  // logic
  int selectedIndex = 0;
  // accessing the drink model
  final drink = DrinkModel.drinks;
  static const List<IconData> iconList = [
    Icons.straighten_outlined,
    Icons.align_vertical_bottom,
    Icons.align_vertical_top,
    Icons.align_vertical_center_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          //widget for itme name and description and price
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      drink[_currentPage.round()].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      drink[_currentPage.round()].descrebtion,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ ${drink[_currentPage.round()].price.toString()}",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          //widget for itme image
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: drink.length,
            itemBuilder: (context, index) {
              final scale = 1 - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 350;
              return Padding(
                padding: EdgeInsets.all(12),
                child: Transform.translate(
                  offset: Offset(translateY, 0),
                  child: Transform.scale(
                    scale: scale.clamp(0.5, 2),

                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              drink[index].image,
                              height: 700,

                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              bottom: 182,
                              right: 0,
                              left: 0,
                              child: Image.asset("assets/drinks/shadow.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // widget for malty selection
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black87),
                            color: selectedIndex == index
                                ? Colors.orange
                                : Colors.white,
                          ),
                          child: Icon(
                            iconList[index],
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black54,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ToggelWidget(),
                      SizedBox(width: 20),
                      Expanded(child: QuntityWidget()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
