import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/cart.dart';
import 'package:shopping/view/cart_detail.dart';
import 'package:shopping/view/get_item.dart';
import 'package:shopping/view/item_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('App'),
        actions: [
          TextButton(
            child: Text('item'),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => GetItem(),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_detailList(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final database = Provider.of<MyDatabase>(context, listen: false);

          database.createCart();
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<ShoppingCart>> _detailList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return StreamBuilder(
      stream: database.getCart(),
      builder: (context, AsyncSnapshot<List<ShoppingCart>> snapshot) {
        final details = snapshot.data ?? [];

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: details.length,
          itemBuilder: (context, index) {
            final item = details[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          CartDetail(id: item.id),
                    ),
                  );
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text('Cart ${item.id}'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
