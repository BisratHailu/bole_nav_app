import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/color.dart';




class BoleNavProgressIndicator extends StatelessWidget {
  final Color color;
  final double indicatorSize;
  const  BoleNavProgressIndicator({super.key,this.color =  BoleNavColor.primaryColor,this.indicatorSize = 35});

  @override
  Widget build(BuildContext context) {
    return SpinKitWaveSpinner(
      color:color,
      size: indicatorSize,
    );
  }
}
