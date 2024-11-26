import 'package:bole_nav_app/core/view_models/page_manager_model.dart';
import 'package:bole_nav_app/core/view_models/post_model.dart';
import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:bole_nav_app/ui/widgets/reusable_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/view_state.dart';
import '../shared/base_view.dart';
import '../shared/indicator/reusable_active_indicator.dart';
import '../shared/indicator/reusable_inactive_indicator.dart';
import '../shared/post_cards/reusable_latest_post_card.dart';
import '../shared/reusable_header_title.dart';
import '../shared/shimmer/latest_post_shimmer_card.dart';
import '../utils/consts.dart';
import '../widgets/reusable_banner.dart';

class LatestPostsView extends StatelessWidget {
  const LatestPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BoleNavColor.lightBlue,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() => BaseView<PostModel>(
        onModelReady: (model) async => await model.intPosts(),
        builder: (context, postModel, _) => RefreshIndicator(
          color: BoleNavColor.primaryColor,
          backgroundColor: BoleNavColor.white,
          onRefresh: () async {
            await postModel.loadPosts();
          },
          child: ListView(
            children: [
              _buildAppBar(),
              const SizedBox(
                height: 20,
              ),
              _buildBanner(),
              _buildPopularPostsHeaderTitle(),
              const SizedBox(height: 10),
              _buildPosts(context, postModel),
            ],
          ),
        ),
      );

  Widget _buildAppBar() => const ReusableAppBar();

  Widget _buildPosts(BuildContext context, PostModel postModel) =>
      postModel.getState<PostsViewState>() == PostsViewState.busy
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: (index == 0) ? 15 : 0),
                child: const LatestPostShimmerCard(),
              ),
            )
          : postModel.posts.isEmpty
              ? ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: BoleNavConst.kNoStatus(context),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: postModel.posts.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: (index == postModel.posts.length - 1) ? 75 : 0,
                      top: (index == 0) ? 15 : 0,
                    ),
                    child: ReusableLatestPostCard(post: postModel.posts[index]),
                  ),
                );

  Widget _buildBanner() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          ReusableBanner(
            images: BoleNavConst.bannerImages,
            onTap: (value) {},
          ),
          const SizedBox(height: 15),
          _buildIndicators()
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 15,
        width: 300,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Center(
          child: BaseView<PageManagerModel>(
            builder: (context, pageManagerModel, _) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  pageManagerModel.currentAdBannerIndex == index
                      ? const ReusableActiveIndicator()
                      : const ReusableInactiveIndicator(),
              itemCount: BoleNavConst.bannerImages.length,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularPostsHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ReusableHeaderTitle(title: 'Latest posts', onTap: () => {}),
    );
  }
}
