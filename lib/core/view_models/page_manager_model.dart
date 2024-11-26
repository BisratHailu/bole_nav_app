import 'package:flutter/material.dart';

import 'base_model.dart';

class PageManagerModel extends BaseModel {
  bool canDispose = false;

  // Bottom bar is tapped
  bool _pageTapped = false;

  bool get pageTapped => _pageTapped;

  // Banner current index
  int _currentAdBannerIndex = 0;

  int get currentAdBannerIndex => _currentAdBannerIndex;


  // Selected bottom tab
  int _currentBottomBarIndex = 0;

  int get currentBottomBarIndex => _currentBottomBarIndex;

  // Bottom tabs controller
  late TabController _pagesController;

  TabController get pagesController => _pagesController;

  // Bottom tabs controller
  late PageController _adBannerController;

  PageController get adBannerController => _adBannerController;





  void initControllers(TickerProvider vsync) {
    _pagesController = TabController(length: 4, vsync: vsync, initialIndex: 0);
    _adBannerController = PageController(initialPage: 0, viewportFraction: 0.9);
  }



  // Set selected bottom tab index
  set setBottomBarIndex(int index) {
    _currentBottomBarIndex = index;
    notifyListeners();
  }

  // Set ad banner index
  set setAdBannerIndex(int index) {
    _currentAdBannerIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    if (canDispose) {
      super.dispose();
    }
  }
}
