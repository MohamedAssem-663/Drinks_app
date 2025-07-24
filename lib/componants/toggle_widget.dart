import 'package:flutter/material.dart';

class ToggelWidget extends StatefulWidget {
  const ToggelWidget({super.key});

  @override
  State<ToggelWidget> createState() => _ToggelWidgetState();
}

class _ToggelWidgetState extends State<ToggelWidget> {
  bool isIced = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          _buildToggleSelection("Hot", !isIced),
          _buildToggleSelection("Iced", isIced),
        ],
      ),
    );
  }

  Widget _buildToggleSelection(label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIced = label == 'Iced';
        });
      },
      child: AnimatedContainer(
        curve: Curves.linear,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomCenter,
        duration: Duration(microseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? Colors.white : Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
