import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/controllers/vending_controller.dart';

import '../../models/snacks.dart';
import '../theme.dart';

class LeftMain extends StatelessWidget {
  LeftMain({Key? key, }) : super(key: key);

  final VendingController vendingController = Get.put(VendingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(50),
      width: MediaQuery.of(context).size.width / 3.6,
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: bgDark1Clr,
      ),
      child: Column(
        children: [items(), dropWidget()],
      ),
    );
  }

  Widget dropWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundDark2kClr,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: Obx(
          () {
            String snackName = vendingController.selectedSnack.value;
            return Text(
              snackName != "Push" ? '$snackName is dropped' : "Push",
              style: Themes.importantText.copyWith(color: whitekClr),
            );
          },
        )),
      ),
    );
  }

  Widget items() {
    return Expanded(
      flex: 5,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        crossAxisSpacing: 1,
        children: Snack.dummySnacks.map((Snack e) {
          return Container(
            color: backgroundDark2kClr,
            child: Column(children: [
              Expanded(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Image.asset(
                    e.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${e.number}',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: Themes.mtitle.copyWith(color: orangeTextClr),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '   ${e.price}  JD\'s',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: Themes.mtitle.copyWith(color: whitekClr),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
