import 'package:bole_nav_app/ui/shared/router/router.dart';
import 'package:bole_nav_app/ui/utils/theme.dart';
import 'package:bole_nav_app/ui/views/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import 'core/services/locator.dart';


void main() {
  setupLocator();
  locator<BoleNavTheme>().setTheme();
  runApp(const BoleNav());
}

class BoleNav extends StatelessWidget {
  const BoleNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: BoleNavRouter.generateRoute,
        home: const LandingView(),
        theme: ThemeData().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}


