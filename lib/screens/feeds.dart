import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/feeds_products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => FeedProducts(),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(3, index.isEven ? 4 : 5),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   childAspectRatio: 260 / 290,
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   children: List.generate(
      //     10,
      //     (index) => FeedProducts(),
      //   ),
      // ),
    );
  }
}
