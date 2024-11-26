import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/models/post.dart';

class PostDetailView extends StatelessWidget {
  static const kPostDetailView = 'post_detail_view';
  final Post post;
  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildStack(),
    );
  }

  Widget _buildStack() => Stack(
        children: [_buildBackground(), _buildBody()],
      );

  Widget _buildBackground() => Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 400,
          width: double.maxFinite,
          child: CachedNetworkImage(
            imageUrl: post.jetpack_featured_media_url ?? '',
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildBody() => NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[_buildSliverAppBar(context,innerBoxIsScrolled)];
        },
        body: Container(
          decoration: const BoxDecoration(
            color: BoleNavColor.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            ),
          ),
          child: _buildContentSection(),
        ),
      );

  SliverAppBar _buildSliverAppBar(BuildContext context,bool innerBoxIsScrolled) => SliverAppBar(
        expandedHeight: 300,
        pinned: true,
        floating: false,


        backgroundColor:
            innerBoxIsScrolled ? BoleNavColor.white : Colors.transparent,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        shadowColor: Colors.transparent,
        title: _buildTitleBar(context,innerBoxIsScrolled),
        bottom: _buildContent(innerBoxIsScrolled),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          stretchModes: const [StretchMode.fadeTitle],
          background: Container(),
        ),
      );

  Widget _buildTitleBar(BuildContext context, bool isScrolled) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildBackArrow(context,isScrolled), _buildRightSection()],
        ),
      );

  Widget _buildBackArrow(BuildContext context,bool isScrolled) => CircleAvatar(
        backgroundColor: BoleNavColor.white,
        radius: 15,
        child: GestureDetector(
          onTap: () =>Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: BoleNavColor.primaryColor,
            size: 20,
          ),
        ),
      );

  Widget _buildRightSection() => Row(
        children: [
          CircleAvatar(
            backgroundColor: BoleNavColor.white,
            radius: 15,
            child: GestureDetector(
              child: const Icon(
                Icons.favorite_border,
                color: BoleNavColor.primaryColor,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 15),
          CircleAvatar(
            backgroundColor: BoleNavColor.white,
            radius: 15,
            child: GestureDetector(
              child: const Icon(
                Icons.share,
                color: BoleNavColor.primaryColor,
                size: 20,
              ),
            ),
          )
        ],
      );
  PreferredSizeWidget _buildContent(bool isScrolled) => PreferredSize(

        preferredSize: const Size(double.maxFinite, 65),
        child: isScrolled
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  post.title?.rendered ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
                ),
              )
            : Container(),
      );

  Widget _buildContentSection() => Padding(
        padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
        child: Column(
          children: [
            Text(
              post.title?.rendered ?? '',
              style:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Html(
                  data: post.content?.rendered ?? '',
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
            ),
          ],
        ),
      );
}
