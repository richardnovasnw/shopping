import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

part 'cart.g.dart';

class BuyableItems extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()();
}

class ShoppingCarts extends Table {
  IntColumn get id => integer().autoIncrement()();
  // we could also store some further information about the user creating
  // this cart etc.
}

@DataClassName('ShoppingCartEntry')
class ShoppingCartEntries extends Table {
  // id of the cart that should contain this item.
  IntColumn get shoppingCart => integer()();
  // id of the item in this cart
  IntColumn get item => integer()();
  // again, we could store additional information like when the item was
  // added, an amount, etc.
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [BuyableItems, ShoppingCarts, ShoppingCartEntries])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
//GET
  Stream<List<ShoppingCart>> getCart() => (select(shoppingCarts)).watch();
  Stream<List<BuyableItem>> getItem() => (select(buyableItems)).watch();

  Stream<List<BuyableItem>> cartDetails(int cartId) {
    final entryQuery = select(buyableItems).join(
      [
        innerJoin(
          shoppingCartEntries,
          shoppingCartEntries.item.equalsExp(buyableItems.id),
        )
      ],
    )..where(shoppingCartEntries.shoppingCart.equals(cartId));

    return entryQuery.watch().map((rows) {
      return rows.map((e) => e.readTable(buyableItems)).toList();
    });
  }

  //INSERT
  Future addToCart(ShoppingCartEntry add) =>
      into(shoppingCartEntries).insert(add);

  Future addItems(BuyableItem add) => into(buyableItems).insert(add);
  Future<CartWithItems> createCart() async {
    final id = await into(shoppingCarts).insert(const ShoppingCartsCompanion());
    final cart = ShoppingCart(id: id);
    // we set the items property to [] because we've just created the cart - it will be empty
    return CartWithItems(cart, []);
  }
//   Future<List<Cart>> sortEntriesAlphabetically() {
//   return (select(details)..orderBy([(t) => OrderingTerm(expression: t.id)])).get();
// }
}

class CartWithItems {
  final ShoppingCart cart;
  final List<BuyableItem> itm;

  CartWithItems(this.cart, this.itm);
}
