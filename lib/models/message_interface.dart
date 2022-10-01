

abstract class MessageInterface {
  String selectedWithoutFunds();
  String refund(double change);
  String unsupportedUnits();
  String notEnoughFunds();
}
