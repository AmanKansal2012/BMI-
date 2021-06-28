import 'package:flutter/material.dart';
class Reusablecard extends StatelessWidget {
  Reusablecard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04,right: MediaQuery.of(context).size.width * 0.04,top: MediaQuery.of(context).size.height * 0.01,bottom: MediaQuery.of(context).size.height * 0.01),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}