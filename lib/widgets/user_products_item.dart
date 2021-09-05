import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';


class UserProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final double? price;
  final String? imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl,this.price);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title!),
        subtitle: Text(price.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl!),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () { 
                  Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id );
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ));
  }
}
