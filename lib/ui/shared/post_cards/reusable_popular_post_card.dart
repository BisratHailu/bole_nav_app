import 'package:bole_nav_app/core/models/post.dart';
import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/consts.dart';
import '../../views/post_detail_view.dart';

class ReusablePopularPostCard extends StatelessWidget {
  final Post post;
  const ReusablePopularPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context,PostDetailView.kPostDetailView,arguments: post),

      child: Card(
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
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BoleNavColor.lightBlue),
          child: Column(
            children: [
              _buildUpperSection(),

              const SizedBox(height: 15),
              _buildLowerSection()],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperSection() => Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              post.title?.rendered ?? '',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: post.jetpack_featured_media_url ?? '',
                fit: BoxFit.cover,
                placeholder: (context, text) => Container(),
              ),
            ),
          )
        ],
      );

  Widget _buildLowerSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildDate(), _buildFavoriteButton()],
      );

  Widget _buildDate() => Text(
        '${BoleNavConst.getMonthName(DateTime.parse(post.date ?? '').month)} ${DateTime.parse(post.date ?? '').day}, ${DateTime.parse(post.date ?? '').year}',
      );

  Widget _buildFavoriteButton() => const FaIcon(
        Icons.favorite_border,
        color: BoleNavColor.mediumGray,
        size: 25,
      );
}
