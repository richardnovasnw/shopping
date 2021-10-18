import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/cart.dart';

class GetItem extends StatefulWidget {
  const GetItem({Key? key}) : super(key: key);

  @override
  _GetItemState createState() => _GetItemState();
}

class _GetItemState extends State<GetItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_list(context)],
        ),
      ),
    );
  }

  StreamBuilder<List<BuyableItem>> _list(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);

    return StreamBuilder(
      stream: database.getItem(),
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
                child: ListTile(
                  title: Text('${item.name}'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
