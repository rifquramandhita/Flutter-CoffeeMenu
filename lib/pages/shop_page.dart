import 'package:flutter/material.dart';
import 'package:coffee_menus/components/coffee_tile.dart';
import 'package:coffee_menus/models/coffee.dart';
import 'package:coffee_menus/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToChart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToUserCart(coffee);
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
                "How would you like yout coffee?",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];
                        return CoffeeTile(
                          coffee: eachCoffee,
                          onPressed: () => addToChart(eachCoffee),
                          iconTrailing: Icon(Icons.add),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
