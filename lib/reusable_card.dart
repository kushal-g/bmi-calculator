
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final Function cardOnTap;
  ReusableCard({@required this.colour, this.cardChild,this.cardOnTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: cardOnTap,
        child: Container(
        child:cardChild,
        margin:EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}