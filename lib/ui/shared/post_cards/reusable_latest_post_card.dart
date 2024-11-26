import 'package:bole_nav_app/core/models/post.dart';
import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:bole_nav_app/ui/views/post_detail_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/consts.dart';

class ReusableLatestPostCard extends StatelessWidget {
  final Post post;
  const ReusableLatestPostCard({super.key, required this.post});

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
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BoleNavColor.lightBlue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUpperSection(),
              const SizedBox(height: 15),
              _buildMiddleSection(),
              _buildLowerSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperSection() => SizedBox(
        height: 150,
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: post.jetpack_featured_media_url ?? '',
            fit: BoxFit.cover,
            placeholder: (context, text) => Container(),
          ),
        ),
      );

  Widget _buildMiddleSection() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                post.title?.rendered ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Expanded(
                child: Html(
                  data: post.content?.rendered,
                  style: {
                    "p": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h1": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h2": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h3": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h4": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h5": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "h6": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400),
                    "li": Style(
                        color: BoleNavColor.darkGray,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400,
                        listStyleType: ListStyleType.circle,
                        verticalAlign: VerticalAlign.baseline,
                        padding: HtmlPaddings.zero,
                        margin: Margins.zero),
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildLowerSection() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildDate(), _buildFavoriteButton()],
        ),
      );

  Widget _buildDate() => Text(
        '${BoleNavConst.getMonthName(DateTime.parse(post.date ?? '').month)} ${DateTime.parse(post.date ?? '').day}, ${DateTime.parse(post.date ?? '').year}',
        maxLines: 1,
      );

  Widget _buildFavoriteButton() => const FaIcon(
        Icons.favorite_border,
        color: BoleNavColor.mediumGray,
        size: 25,
      );
}
