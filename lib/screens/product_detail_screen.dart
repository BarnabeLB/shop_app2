import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments
        as String; //récupération des données en lien avec l'interaction utilisateur
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(
        productId); // on charge la variable avec le produit dont l'id correspond (fonction avec firstWhere dans les providers)

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title
            .toString()), // on affiche le titre de l'objet loadedProduct correspondant.
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '€' + loadedProduct.price.toString(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description.toString(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: 20,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
