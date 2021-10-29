import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context).settings.arguments as String;
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    if (popular == 'popular') {
      productsList = productsProvider.popularProducts;
    }
    return Scaffold(
      // body: StaggeredGridView.countBuilder(
      //   crossAxisCount: 6,
      //   itemCount: 8,
      //   itemBuilder: (BuildContext context, int index) => FeedProducts(),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(3, index.isEven ? 4 : 5),
      //   mainAxisSpacing: 8.0,
      //   crossAxisSpacing: 6.0,
      // ),
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
