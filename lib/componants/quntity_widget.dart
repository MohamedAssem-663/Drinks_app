import 'package:flutter/material.dart';

class QuntityWidget extends StatefulWidget {
  const QuntityWidget({super.key});

  @override
  State<QuntityWidget> createState() => _QuntityWidgetState();
}

class _QuntityWidgetState extends State<QuntityWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (number > 1) {
                    number--;
                  }
                });
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              number.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  number++;
                });
              },
              child: Text(
                "+",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
