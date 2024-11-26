import 'package:flutter/cupertino.dart';

import '../../utils/color.dart';

class BoleNavShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double bottomLeft;
  final double topLeft;
  final double bottomRight;
  final double topRight;
  final bool isCircle;

  const BoleNavShimmer.circular(
      {super.key,
        this.isCircle = true,
      required this.height,
      required this.width,
      this.bottomLeft = 500,
      this.bottomRight = 500,
      this.topRight = 500,
      this.topLeft = 500});

  const BoleNavShimmer.rectangular(
      {super.key,
        this.isCircle = false,
      required this.height,
      required this.width,
      this.bottomLeft = 0,
      this.bottomRight = 0,
      this.topRight = 0,
      this.topLeft = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: isCircle ? const BoxDecoration(
        color: BoleNavColor.white,
        shape: BoxShape.circle
      ):BoxDecoration(
        color: BoleNavColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          topRight: Radius.circular(topRight),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
    );
  }
}
