import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(
        title: 'hai title',
        home: ShoppingList(
          products: <Product>[
            Product(name: 'kong'),
            Product(name: 'fan'),
            Product(name: 'wu'),
            Product(name: 'Flutter'),
            Product(name: 'OK'),
          ],
        ),
      )

  );
}

class Product {
  // {} dark 可选参数
  const Product({this.name});
  final String name;
}

// 重命名回调
typedef void CartChangeCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.isCart, this.onCartChanged})
  : product = product,
  super(key: new ObjectKey(product));

  final Product product;
  final bool isCart;
  final CartChangeCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return isCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!isCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: (){
        onCartChanged(product, !isCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products})
      : super(key: key);
  final List<Product> products;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShoppingListState();
  }

}

class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool isCart) {
    print('hand');
    setState(() {
      if (isCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: new ListView(
        padding:  EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            isCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }

}

