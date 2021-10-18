import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/cart.dart';
import 'package:shopping/view/item_screen.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _CartDetailState createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _buttomModal();
          },
        ),
        body: SingleChildScrollView(child: _list(context)));
  }

  _buttomModal() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ItemScreen(
            id: widget.id,
          );
        });
  }

  StreamBuilder<List<BuyableItem>> _list(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return StreamBuilder(
      stream: database.cartDetails(widget.id),
      builder: (context, AsyncSnapshot<List<BuyableItem>> snapshot) {
        final details = snapshot.data ?? [];

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: details.length,
          itemBuilder: (context, index) {
            final item = details[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('${item.name}'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
