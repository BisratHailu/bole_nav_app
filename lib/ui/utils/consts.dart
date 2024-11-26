import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../shared/bole_nav_progress_indicator.dart';
import 'color.dart';




typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class BoleNavConst {


  static String description =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also";

  static const List<String> bannerImages = [
    'assets/images/1.1.jpg',
    'assets/images/1.2.jpg',
    'assets/images/1.3.jpg',
    'assets/images/1.4.jpg',
    'assets/images/1.5.jpg',


  ];


  void showErrorToast(String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      description: Text(message,style: const TextStyle(fontWeight: FontWeight.w500),),
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.check),
      showIcon: true,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      primaryColor: BoleNavColor.red,
      foregroundColor: BoleNavColor.white,
      showProgressBar: false,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  void showSuccessToast(String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      description: Text(message,style: const TextStyle(fontWeight: FontWeight.w500),),
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.check),
      showIcon: true,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      primaryColor: BoleNavColor.green,
      showProgressBar: false,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static kNoStatus(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: const Image(
        image: AssetImage('assets/images/no.png'),
        fit: BoxFit.cover,
        height: 200,
        width: 200,
      ),
    );
  }

  static Widget kPageLoader(context) {
    return Container(
      color: BoleNavColor.black.withOpacity(0.3),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          height: 100,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BoleNavColor.lightBlue,
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child:  BoleNavProgressIndicator(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Please wait',
                  style: TextStyle(color: BoleNavColor.darkGray),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  static String priceFormatter(String price) {
    String flippedPrice = '';
    String arrangedPrice = '';
    String finalPrice = '';

    for (int i = price.length - 1; i >= 0; i--) {
      flippedPrice = flippedPrice + price[i];
    }

    for (int i = 0; i < flippedPrice.length; i++) {
      arrangedPrice = arrangedPrice + flippedPrice[i];
      if ((i + 1) % 3 == 0 && (i + 1) != flippedPrice.length - 0) {
        arrangedPrice = '$arrangedPrice,';
      }
    }

    for (int i = arrangedPrice.length - 1; i >= 0; i--) {
      finalPrice = finalPrice + arrangedPrice[i];
    }

    return finalPrice;
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }



}
