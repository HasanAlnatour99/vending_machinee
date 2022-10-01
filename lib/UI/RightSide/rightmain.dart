import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/vending_controller.dart';
import '../theme.dart';
import 'numbers.dart';

class RightMain extends StatelessWidget {
  RightMain({Key? key}) : super(key: key);

  final VendingController vendingController = Get.put(VendingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      height: MediaQuery.of(context).size.height / 1.3,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: greyBGkClr,
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Obx(() => creditCard()),
          const SizedBox(
            height: 50,
          ),
          inputCard(),
          const validCurrency(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 70,
              child: Center(
                  child: TextField(
                controller: vendingController.selectedSnackController,
                textAlign: TextAlign.center,
                showCursor: false,
                style: const TextStyle(fontSize: 40),
                // Disable the default soft keybaord
                keyboardType: TextInputType.none,
              )),
            ),
          ),
          NumPad(
            buttonSize: 50,
            buttonColor: inputsBGkClr,
            iconColor: Colors.deepOrange,
            controller: vendingController.selectedSnackController,
            delete: () {
              vendingController.selectedSnackController.text =
                  vendingController.selectedSnackController.text.substring(
                      0,
                      vendingController.selectedSnackController.text.length -
                          1);
            },
            // do something with the input numbers
            onSubmit: () {
              vendingController.getSnack();
            },
          ),
        ],
      ),
    );
  }

  SizedBox creditCard() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
          color: greenClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Credit",
                softWrap: true,
                style: Themes.header2Style,
              ),
              Text("${vendingController.credit.value.toStringAsFixed(2)} JD's",
                  style: Themes.header2Style),
            ],
          )),
    );
  }

  SizedBox inputCard() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: inputsBGkClr,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 250, child: inputV()),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_sharp,
                      color: inputsBGkClr),
                  onPressed: vendingController.setMoney,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputV() {
    return GetBuilder(
      init: VendingController(),
      builder: (_) => TextField(
        controller: vendingController.inserMoneyController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'([+-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?'),
          ),
          LengthLimitingTextInputFormatter(4),
        ],
        textAlign: TextAlign.center,
        style: Themes.header3Style.copyWith(color: Colors.black87),
        decoration: InputDecoration(
          alignLabelWithHint: false,
          filled: true,
          fillColor: Colors.white,
          suffix: const Text("JD's"),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          hintText: 'Insert money',
          hintStyle: Themes.header3Style,
        ),
      ),
    );
  }
}

class validCurrency extends StatelessWidget {
  const validCurrency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "The supported units are 100 fils (0.1), Quarter(0.25) JD, Half(0.5) JD, 1 JD, 5 JDs, and 10 JDs.",
        style:
            Themes.header3Style.copyWith(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}
