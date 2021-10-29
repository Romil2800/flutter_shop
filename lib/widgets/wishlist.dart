import 'package:flutter/material.dart';
import 'package:flutter_shop/consts/my_icons.dart';
import 'package:flutter_shop/provider/favs_provider.dart';
import 'package:flutter_shop/services/global_method.dart';
import 'package:flutter_shop/widgets/wishlist_empty.dart';
import 'package:flutter_shop/widgets/wishlist_full.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    final favsProvider = Provider.of<FavsProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist(${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear Wishlist!',
                        'Do you want to clear your wishlist?',
                        () => favsProvider.clearFavs(),
                        context);
                  },
                  icon: Icon(MyAppIcons.trash),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: favsProvider.getFavsItems.values.toList()[index],
                  child: WishlistFull(
                    productId: favsProvider.getFavsItems.keys.toList()[index],
                  ),
                );
              },
            ),
          );
  }
}
