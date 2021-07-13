import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  
    static const routeName='/product-detail';

  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  
  @override
  Widget build(BuildContext context) { 
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
