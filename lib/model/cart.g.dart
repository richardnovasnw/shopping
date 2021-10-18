// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BuyableItem extends DataClass implements Insertable<BuyableItem> {
  final int? id;
  final String? name;
  final int quantity;
  final int price;
  BuyableItem(
      {this.id, this.name, required this.quantity, required this.price});
  factory BuyableItem.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BuyableItem(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      quantity: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    return map;
  }

  BuyableItemsCompanion toCompanion(bool nullToAbsent) {
    return BuyableItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory BuyableItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyableItem(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
    };
  }

  BuyableItem copyWith({int? id, String? name, int? quantity, int? price}) =>
      BuyableItem(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('BuyableItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyableItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class BuyableItemsCompanion extends UpdateCompanion<BuyableItem> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<int> quantity;
  final Value<int> price;
  const BuyableItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  BuyableItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required int quantity,
    required int price,
  })  : quantity = Value(quantity),
        price = Value(price);
  static Insertable<BuyableItem> custom({
    Expression<int?>? id,
    Expression<String?>? name,
    Expression<int>? quantity,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  BuyableItemsCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<int>? quantity,
      Value<int>? price}) {
    return BuyableItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyableItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $BuyableItemsTable extends BuyableItems
    with TableInfo<$BuyableItemsTable, BuyableItem> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BuyableItemsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  late final GeneratedColumn<int?> quantity = GeneratedColumn<int?>(
      'quantity', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<int?> price = GeneratedColumn<int?>(
      'price', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, quantity, price];
  @override
  String get aliasedName => _alias ?? 'buyable_items';
  @override
  String get actualTableName => 'buyable_items';
  @override
  VerificationContext validateIntegrity(Insertable<BuyableItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BuyableItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BuyableItem.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BuyableItemsTable createAlias(String alias) {
    return $BuyableItemsTable(_db, alias);
  }
}

class ShoppingCart extends DataClass implements Insertable<ShoppingCart> {
  final int id;
  ShoppingCart({required this.id});
  factory ShoppingCart.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ShoppingCart(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  ShoppingCartsCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartsCompanion(
      id: Value(id),
    );
  }

  factory ShoppingCart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCart(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  ShoppingCart copyWith({int? id}) => ShoppingCart(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCart(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ShoppingCart && other.id == this.id);
}

class ShoppingCartsCompanion extends UpdateCompanion<ShoppingCart> {
  final Value<int> id;
  const ShoppingCartsCompanion({
    this.id = const Value.absent(),
  });
  ShoppingCartsCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<ShoppingCart> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  ShoppingCartsCompanion copyWith({Value<int>? id}) {
    return ShoppingCartsCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartsCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartsTable extends ShoppingCarts
    with TableInfo<$ShoppingCartsTable, ShoppingCart> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ShoppingCartsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'shopping_carts';
  @override
  String get actualTableName => 'shopping_carts';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingCart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingCart map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ShoppingCart.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ShoppingCartsTable createAlias(String alias) {
    return $ShoppingCartsTable(_db, alias);
  }
}

class ShoppingCartEntry extends DataClass
    implements Insertable<ShoppingCartEntry> {
  final int shoppingCart;
  final int item;
  ShoppingCartEntry({required this.shoppingCart, required this.item});
  factory ShoppingCartEntry.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ShoppingCartEntry(
      shoppingCart: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shopping_cart'])!,
      item: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['shopping_cart'] = Variable<int>(shoppingCart);
    map['item'] = Variable<int>(item);
    return map;
  }

  ShoppingCartEntriesCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartEntriesCompanion(
      shoppingCart: Value(shoppingCart),
      item: Value(item),
    );
  }

  factory ShoppingCartEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartEntry(
      shoppingCart: serializer.fromJson<int>(json['shoppingCart']),
      item: serializer.fromJson<int>(json['item']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shoppingCart': serializer.toJson<int>(shoppingCart),
      'item': serializer.toJson<int>(item),
    };
  }

  ShoppingCartEntry copyWith({int? shoppingCart, int? item}) =>
      ShoppingCartEntry(
        shoppingCart: shoppingCart ?? this.shoppingCart,
        item: item ?? this.item,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntry(')
          ..write('shoppingCart: $shoppingCart, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(shoppingCart, item);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartEntry &&
          other.shoppingCart == this.shoppingCart &&
          other.item == this.item);
}

class ShoppingCartEntriesCompanion extends UpdateCompanion<ShoppingCartEntry> {
  final Value<int> shoppingCart;
  final Value<int> item;
  const ShoppingCartEntriesCompanion({
    this.shoppingCart = const Value.absent(),
    this.item = const Value.absent(),
  });
  ShoppingCartEntriesCompanion.insert({
    required int shoppingCart,
    required int item,
  })  : shoppingCart = Value(shoppingCart),
        item = Value(item);
  static Insertable<ShoppingCartEntry> custom({
    Expression<int>? shoppingCart,
    Expression<int>? item,
  }) {
    return RawValuesInsertable({
      if (shoppingCart != null) 'shopping_cart': shoppingCart,
      if (item != null) 'item': item,
    });
  }

  ShoppingCartEntriesCompanion copyWith(
      {Value<int>? shoppingCart, Value<int>? item}) {
    return ShoppingCartEntriesCompanion(
      shoppingCart: shoppingCart ?? this.shoppingCart,
      item: item ?? this.item,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (shoppingCart.present) {
      map['shopping_cart'] = Variable<int>(shoppingCart.value);
    }
    if (item.present) {
      map['item'] = Variable<int>(item.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntriesCompanion(')
          ..write('shoppingCart: $shoppingCart, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartEntriesTable extends ShoppingCartEntries
    with TableInfo<$ShoppingCartEntriesTable, ShoppingCartEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ShoppingCartEntriesTable(this._db, [this._alias]);
  final VerificationMeta _shoppingCartMeta =
      const VerificationMeta('shoppingCart');
  late final GeneratedColumn<int?> shoppingCart = GeneratedColumn<int?>(
      'shopping_cart', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _itemMeta = const VerificationMeta('item');
  late final GeneratedColumn<int?> item = GeneratedColumn<int?>(
      'item', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [shoppingCart, item];
  @override
  String get aliasedName => _alias ?? 'shopping_cart_entries';
  @override
  String get actualTableName => 'shopping_cart_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingCartEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shopping_cart')) {
      context.handle(
          _shoppingCartMeta,
          shoppingCart.isAcceptableOrUnknown(
              data['shopping_cart']!, _shoppingCartMeta));
    } else if (isInserting) {
      context.missing(_shoppingCartMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ShoppingCartEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ShoppingCartEntry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ShoppingCartEntriesTable createAlias(String alias) {
    return $ShoppingCartEntriesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BuyableItemsTable buyableItems = $BuyableItemsTable(this);
  late final $ShoppingCartsTable shoppingCarts = $ShoppingCartsTable(this);
  late final $ShoppingCartEntriesTable shoppingCartEntries =
      $ShoppingCartEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [buyableItems, shoppingCarts, shoppingCartEntries];
}
