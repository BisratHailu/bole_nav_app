import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/color.dart';

class ReusableAppBar extends StatelessWidget {
  const ReusableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: BoleNavColor.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
           Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => {},
                  child: const  FaIcon(
                    FontAwesomeIcons.listDots,
                    color: BoleNavColor.mediumGray,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'BoleNav',
                  style: TextStyle(
                      color: BoleNavColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => {},
                  child: const FaIcon(
                    Icons.search,
                    color: BoleNavColor.mediumGray,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: const FaIcon(
                    Icons.notifications,
                    color: BoleNavColor.mediumGray,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
