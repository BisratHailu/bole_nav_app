import 'package:flutter/material.dart';

import '../../utils/color.dart';

class ReusableInactiveIndicator extends StatelessWidget {
  final Color color;
  const ReusableInactiveIndicator(
      {super.key, this.color = BoleNavColor.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 5,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100)));
  }
}
