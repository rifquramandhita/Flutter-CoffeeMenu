import 'package:flutter/material.dart';
import 'package:coffee_menus/models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Icon iconTrailing;

  CoffeeTile({super.key, required this.coffee, required this.iconTrailing, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text("\$ ${coffee.price}"),
        leading: Image.asset(
          coffee.image,
        ),
        trailing: IconButton(icon: iconTrailing, onPressed: onPressed,),
      ),
    );
  }
}
