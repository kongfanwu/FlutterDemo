import 'package:flutter/material.dart';

class FWTest {

  const FWTest({
    this.name,
  });

  final String name;
}

class ShoppingCartView extends StatefulWidget {

  const ShoppingCartView({
    this.keyboardType = TextInputType.text,
    this.name = '1',
    this.decoration = const InputDecoration(),
    this.test = const FWTest(),
  });

  final TextInputType keyboardType;
  final String name;
  final InputDecoration decoration;
  final FWTest test;

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
