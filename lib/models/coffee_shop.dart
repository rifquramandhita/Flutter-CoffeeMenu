import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  final List<Coffee> _shop = [
    Coffee(
      name: "Black Coffee",
      image: "assets/images/black_coffee.png",
      price: 1.0
    ),
    Coffee(
        name: "Cappuccino",
        image: "assets/images/cappuccino.png",
        price: 1.5
    ),
    Coffee(
        name: "Latte",
        image: "assets/images/latte.png",
        price: 1.2
    )
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToUserCart(Coffee item) {
  _userCart.add(item);
  notifyListeners();
  }

  void removeItemFromUserCart(Coffee item){
    _userCart.remove(item);
    notifyListeners();
  }
}