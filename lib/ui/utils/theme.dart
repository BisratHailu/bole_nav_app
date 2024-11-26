import 'package:flutter/services.dart';

import 'color.dart';

class BoleNavTheme{
  void setTheme(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: BoleNavColor.primaryColor,
          statusBarColor: BoleNavColor.white,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true,

        )

    );
  }
}