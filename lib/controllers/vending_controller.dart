import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/vending_machine.dart';

class VendingController extends GetxController {
  late TextEditingController inserMoneyController;
  late TextEditingController selectedSnackController;

  late VendingMachine vm;
  RxDouble credit = 0.0.obs;
  RxString selectedSnack = 'Push'.obs;
  @override
  onInit() {
    super.onInit();
    inserMoneyController = TextEditingController();
    selectedSnackController = TextEditingController();
    vm = VendingMachine();
  }

  @override
  void onClose() {
    super.onClose();
    inserMoneyController.dispose();
    selectedSnackController.dispose();
  }

  void setMoney() {
    double money = double.parse(inserMoneyController.text);
    vm.insertMoney(money);
    inserMoneyController.clear();
    updatecredit();
  }

  void updatecredit() {
    credit.value = vm.credit;
  }

  void updateSnack() {
    selectedSnack.value = vm.selectedSnack;
  }

  void getSnack() {
    int selectedNumber = int.parse(selectedSnackController.text);
    vm.selectSnack(selectedNumber);
    selectedSnackController.clear();
        updatecredit();
    updateSnack();

  }

  void cancelProcessAndRefund() {
    vm.returnChange();
    updatecredit();
    selectedSnack.value = 'Push';
    

  }
}
