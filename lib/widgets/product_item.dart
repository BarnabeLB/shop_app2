import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../screens/products_overview_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final double? price;
  // final String? imageUrl;

  // ProductItem(
  //   this.id,
  //   this.title,
  //   this.price,
  //   this.imageUrl,
  // );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen:
            false); // false indique qu'il n'y aura pas de reconstruction de l'arbre de widget, sauf s'il ya un Consumer

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        header: Text('€' + product.price.toString()),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            //Consumer permet de sélectionner la partie du l'arbre qui sera reconstruite, mais un Provider of avec une séparation intélligente des Widget fait aussi 
            //le travail.
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title!,
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
