import 'package:flutter/material.dart';

import '../utils/color.dart';

class ReusableHeaderTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  ReusableHeaderTitle({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLeadingIcon(),
              if (onTap != null) _buildTrailingIcon()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() => Row(
        children: [
          Container(
            width: 5,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: BoleNavColor.black),
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
                color: BoleNavColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ],
      );

  Widget _buildTrailingIcon() => TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 10),
          ),
        ),
        child: const Text(
          'View all',
          style: TextStyle(
            color: BoleNavColor.mediumGray,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
