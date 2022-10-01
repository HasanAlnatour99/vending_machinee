import 'message_interface.dart';

class Message implements MessageInterface {
  @override
  String notEnoughFunds() {
    return 'Sorry,not enough funds';
  }

  @override
  String refund(double change) {
    return '${change.toStringAsFixed(2)} JD\'s returned';
  }

  @override
  String selectedWithoutFunds() {
    return 'Please insert money to be able to select snack';
  }

  @override
  String unsupportedUnits() {
    return 'This unit is NOT supported, Please enter a supported unit';
  }

}