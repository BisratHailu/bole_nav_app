import 'package:bole_nav_app/core/models/post.dart';
import 'package:bole_nav_app/ui/shared/shimmer/image_shimmer.dart';
import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/consts.dart';
import '../../views/post_detail_view.dart';
import 'bole_nav_shimmer.dart';

class LatestPostShimmerCard extends StatelessWidget {
  const LatestPostShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 350,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: BoleNavColor.lightBlue),
        child: Column(
          children: [
            _buildUpperSection(),
            const SizedBox(height: 25),
            _buildMiddleSection(),
            const SizedBox(height: 35),

            _buildLowerSection()
          ],
        ),
      ),
    );
  }
  Widget _buildUpperSection() => SizedBox(
    height: 150,
    width: double.maxFinite,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: const ImageShimmer(),
    ),
  );

  Widget _buildMiddleSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Shimmer.fromColors(
        highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
        baseColor: BoleNavColor.white,
        child: const BoleNavShimmer.rectangular(
            height: 15, width: double.maxFinite),
      ),
      const SizedBox(height: 10),
      Shimmer.fromColors(
        highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
        baseColor: BoleNavColor.white,
        child: const BoleNavShimmer.rectangular(
            height: 15, width: double.maxFinite),
      ),
      const SizedBox(height: 10),
      Shimmer.fromColors(
        highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
        baseColor: BoleNavColor.white,
        child: const BoleNavShimmer.rectangular(
            height: 15, width: double.maxFinite),
      ),
      const SizedBox(height: 10),


      Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Shimmer.fromColors(
          highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
          baseColor: BoleNavColor.white,
          child: const BoleNavShimmer.rectangular(
              height: 15, width: double.maxFinite),
        ),
      ),
    ],
  );


  Widget _buildLowerSection() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [_buildDate(), _buildFavoriteButton()],
  );

  Widget _buildDate() => Shimmer.fromColors(
    highlightColor: BoleNavColor.lightFillGray.withOpacity(0.75),
    baseColor: BoleNavColor.white,
    child: const BoleNavShimmer.rectangular(height: 15, width: 100),
  );

  Widget _buildFavoriteButton() => const FaIcon(
    Icons.favorite_border,
    color: BoleNavColor.mediumGray,
    size: 25,
  );
}
