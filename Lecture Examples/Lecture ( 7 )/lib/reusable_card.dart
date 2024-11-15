import 'package:flutter/material.dart';

class ReUseableCard extends StatelessWidget {

  final ChildCard;
  final Color col;
  const ReUseableCard({required this.ChildCard,required this.col});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration:
      BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10)),

      child: ChildCard,
    );
  }
}