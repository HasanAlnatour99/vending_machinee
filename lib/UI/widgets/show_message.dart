import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

getXSnackBar(
    {String title = '',
    Color colorBG=backgroundDark2kClr,
    Color colorIcon =Colors.red,
    String messageText = "",
    IconData? icon = Icons.error_outline}) {
    
  Get.snackbar(
    title,
    messageText,
    icon: Icon(icon, color: colorIcon),
    snackPosition: SnackPosition.TOP,
    backgroundColor: colorBG,
    borderRadius: 20,
    margin: const EdgeInsets.all(60),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    maxWidth: 300,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
