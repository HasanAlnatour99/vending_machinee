import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../controllers/vending_controller.dart';
import '../theme.dart';

class CancelWidget extends StatelessWidget {
  const CancelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VendingController vendingController = Get.put(VendingController());
    return GFButton(
      size: 200,
      onPressed: () => vendingController.cancelProcessAndRefund(),
      text: "Cancel",
      textColor: greyBGkClr,
      textStyle: Themes.importantText.copyWith(color: greyBGkClr),
      color: orangeTextClr,
    );
  }
}
