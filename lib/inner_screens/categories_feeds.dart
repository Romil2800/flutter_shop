import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  static const routeName = '/CategoriesFeedsScreen';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context).settings.arguments as String;

    final productsList = productsProvider.findByCategory(categoryName);
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 260 / 500,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(
          productsList.length,
          (index) => ChangeNotifierProvider.value(
            value: productsList[index],
            child: FeedProducts(),
          ),
        ),
      ),
    );
  }
}
