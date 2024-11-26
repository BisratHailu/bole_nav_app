import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:bole_nav_app/ui/views/latest_posts_view.dart';
import 'package:bole_nav_app/ui/views/popular_posts_view.dart';
import 'package:bole_nav_app/ui/views/trending_posts_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/view_models/page_manager_model.dart';
import '../shared/base_view.dart';


class LandingView extends StatefulWidget {
  static const kLandingView = 'landing_view';

  const LandingView({
    super.key,
  });

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<PageManagerModel>(
      onModelReady: (model) {
       model.initControllers(this);
      },
      builder: (context, pageManagerModel, _) => Scaffold(
        backgroundColor: BoleNavColor.white,
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          controller: pageManagerModel.pagesController,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
           const  PopularPostsView(),
            const  LatestPostsView(),
            const TrendingPostsView(),
            Container(),
          ],
        ),
        bottomNavigationBar: Material(
          elevation: 2,
          child: CurvedNavigationBar(
            animationCurve: Curves.easeOutQuart,
            height: 60,
            key: _bottomNavigationKey,
            buttonBackgroundColor: BoleNavColor.primaryColor,
            backgroundColor: BoleNavColor.white,
            color: BoleNavColor.primaryColor,
            index: pageManagerModel.currentBottomBarIndex,
            items: <Widget>[
              _buildNavBarIcons(
                  pageManagerModel, Icons.padding, 'Popular', 0),
              _buildNavBarIcons(pageManagerModel, FontAwesomeIcons.pooStorm,
                  'Latest', 1),
              _buildNavBarIcons(
                  pageManagerModel, FontAwesomeIcons.qrcode, 'Trending', 2),
              _buildNavBarIcons(pageManagerModel, Icons.person, 'Profile', 3),
            ],
            onTap: (index) {
              pageManagerModel.setBottomBarIndex = index;
              pageManagerModel.pagesController.animateTo(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarIcons(PageManagerModel pageManagerModel, IconData icon,
      String label, int index) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 20,
            color: BoleNavColor.white,
          ),
          if (index != pageManagerModel.currentBottomBarIndex)
            Text(
              label,
              style: const TextStyle(color: BoleNavColor.white, fontSize: 12),
            )
        ],
      );
}
