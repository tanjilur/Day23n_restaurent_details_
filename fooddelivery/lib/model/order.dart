import 'dart:html';

import 'package:fooddelivery/model/food.dart';
import 'package:fooddelivery/model/restaurant.dart';

class Order {
  final Restaurant? restaurant;
  final String? date;
  final Food? food;
  final int? quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
}
