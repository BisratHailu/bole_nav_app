import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import 'bole_nav_shimmer.dart';

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
        baseColor: BoleNavColor.white,
        child: const BoleNavShimmer.rectangular(
            bottomLeft: 5,
            bottomRight: 5,
            topLeft: 5,
            topRight: 5,
            height: double.maxFinite,
            width: double.maxFinite));
  }
}
