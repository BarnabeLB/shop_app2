import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

import '../screens/products_overview_screen.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final double? price;
  final String? imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        header: Text('€' + price.toString()),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
          title: Text(
            title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
