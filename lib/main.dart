import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/cart.dart';
import 'package:shopping/view/home_page.dart';

void main() {
  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

