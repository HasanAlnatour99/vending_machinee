// ignore_for_file: prefer_typing_uninitialized_variables

class Snack {
  Snack(this.image, this.number, this.price, this.name);

  final name, price, image;
  final int number;
  static List<Snack> dummySnacks = [
    Snack('assets/images/1.jpg', 1, 0.50, 'layes'),
    Snack('assets/images/2.jpg', 2, 1.00, 'Cheetos'),
    Snack('assets/images/3.jpg', 3, 2.00, 'Oreos'),
    Snack('assets/images/4.jpg', 4, 0.90, 'Fritos'),
    Snack('assets/images/5.jpg', 5, 5.00, 'Trail Mix'),
    Snack('assets/images/6.png', 6, 10.00, 'Tostitos'),
    Snack('assets/images/7.jpg', 7, 3.00, 'Goldfish'),
    Snack('assets/images/8.jpg', 8, 0.50, 'Chex Mix'),
    Snack('assets/images/9.jpg', 9, 0.25, 'Oreo Cookies'),
  ];
}
