import 'package:coffee_menus/components/coffee_tile.dart';
import 'package:coffee_menus/models/coffee.dart';
import 'package:coffee_menus/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false)
        .removeItemFromUserCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  Coffee item = value.userCart[index];
                  return CoffeeTile(
                    coffee: item,
                    iconTrailing: Icon(Icons.remove),
                    onPressed: () => removeItem(item),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
