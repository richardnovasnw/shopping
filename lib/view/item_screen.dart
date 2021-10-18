import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/cart.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List name = ['Shampoo', 'Sugar', 'Chocolate', 'ToothPaste', 'Honey'];
  List price = [10, 20, 30, 40, 50];
  List items = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return ListView.builder(
        itemCount: name.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              database.addToCart(
                  ShoppingCartEntry(shoppingCart: widget.id!, item: items[i]));

              database.addItems(BuyableItem(
                  id: items[i],
                  name: name[i],
                  quantity: items[i],
                  price: price[i]));
            },
            child: ListTile(
              title: Text('${name[i]}'),
            ),
          );
        });
  }
}
