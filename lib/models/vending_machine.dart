// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:vending_machine/models/snacks.dart';

import '../UI/widgets/show_message.dart';
import 'message_machine.dart';
import 'vm_interface.dart';

class VendingMachine extends Message implements VMInterface {
  double credit = 0.0;
  double change = 0.0;
  String selectedSnack = 'Nothing';
  List<double> supportedUnits = [0.1, 0.25, 0.5, 1, 5, 10];

  @override
  void insertMoney(double money) {
    bool support = supportedUnits.contains(money);
    support
        ? (credit = credit + money)
        : getXSnackBar(messageText: unsupportedUnits());
    print(credit);
  }

  @override
  void selectSnack(int selectedNO) {
    if ((selectedNO > Snack.dummySnacks.length) || selectedNO == 0) {
      getXSnackBar(title: 'Please enter a valid number');
    } else {
      for (Snack snack in Snack.dummySnacks) {
        if (snack.number == selectedNO) {
          if (credit > 0.0) {
            snack.price <= credit
                ? dropItem(snack)
                : getXSnackBar(messageText: notEnoughFunds());
          } else {
            getXSnackBar(messageText: selectedWithoutFunds());
          }
        }
      }
    }
  }

  void dropItem(Snack e) {
    credit = credit - e.price;
    selectedSnack = '${e.name}';

    print('$credit credit , ${e.name} name');
  }

  @override
  void returnChange() {
    if (credit != 0) {
      change = credit;
      getXSnackBar(title: refund(change),colorBG: Colors.green,icon: Icons.done,colorIcon: Colors.white);
      credit = 0.0;
    }
    selectedSnack = 'Nothing';
  }
}
