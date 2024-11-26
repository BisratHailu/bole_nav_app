import 'package:flutter/material.dart';

import '../../utils/color.dart';



class ReusableActiveIndicator extends StatelessWidget {
  final Color color;
  const ReusableActiveIndicator({super.key,this.color = BoleNavColor.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(19)),
    );
  }
}
