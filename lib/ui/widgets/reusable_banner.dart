import 'package:bole_nav_app/core/view_models/page_manager_model.dart';
import 'package:bole_nav_app/ui/shared/base_view.dart';
import 'package:bole_nav_app/ui/utils/color.dart';
import 'package:flutter/material.dart';

import '../shared/indicator/reusable_active_indicator.dart';
import '../shared/indicator/reusable_inactive_indicator.dart';

class ReusableBanner extends StatefulWidget {
  final List<String> images;
  final void Function(int) onTap;
  final bool showLoading;
  final int initialPage;

  const ReusableBanner(
      {Key? key,
      required this.images,
      required this.onTap,
      this.initialPage = 0,
      this.showLoading = true})
      : super(key: key);

  @override
  State<ReusableBanner> createState() => _ReusableBannerState();
}

class _ReusableBannerState extends State<ReusableBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<PageManagerModel>(
      builder: (context, pageManagerModel, _) => SizedBox(
        height: 150,
        width: double.infinity,
        child: PageView.builder(
          onPageChanged: (currentIndex) async =>
              pageManagerModel.setAdBannerIndex = currentIndex,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.onTap(index);
              },
              child: _buildBannerItem(
                  image: widget.images[index],
                  pageManagerModel: pageManagerModel),
            );
          },
          itemCount: widget.images.length,
          controller: pageManagerModel.adBannerController,
        ),
      ),
    );
  }


  Widget _buildEffect() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 35,
          width: 300,
          decoration: BoxDecoration(
            color: BoleNavColor.white.withOpacity(0.75),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                BoleNavColor.white.withOpacity(0.1),
                BoleNavColor.white.withOpacity(0.25),
                BoleNavColor.white.withOpacity(0.5),
                BoleNavColor.white.withOpacity(0.75),
                BoleNavColor.white.withOpacity(0.75),
                BoleNavColor.white.withOpacity(0.5),
                BoleNavColor.white.withOpacity(0.1),
              ],
            ),
          ),
        ),
      );

  Widget _buildBannerItem(
      {required String image, required PageManagerModel pageManagerModel}) {
    return Stack(
      children: [
        _buildBannerImage(image),
        _buildEffect(),
      ],
    );
  }

  Widget _buildBannerImage(String image) => Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: BoleNavColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:  Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )

        ),
      );
}
