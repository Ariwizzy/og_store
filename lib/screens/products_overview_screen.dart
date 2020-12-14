import 'package:flutter/material.dart';
import 'package:og_store/screens/cart.dart';
import 'package:og_store/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption options) {
              setState(() {
                if (FilterOption.Favorite == options) {
                  _showFavorite = true;
                } else {
                  _showFavorite = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Only Favorite"),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text("All"),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ),
        ],
      ),
      body: ProductsGrid(_showFavorite),
    );
  }
}
