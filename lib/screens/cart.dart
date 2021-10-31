import 'package:flutter/material.dart';
import 'package:flutter_shop/consts/colors.dart';
import 'package:flutter_shop/consts/my_icons.dart';
import 'package:flutter_shop/provider/cart_provider.dart';
import 'package:flutter_shop/services/global_method.dart';
import 'package:flutter_shop/widgets/cart_empty.dart';
import 'package:flutter_shop/widgets/cart_full.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
      body: cartProvider.getCartItems.isEmpty
          ? Scaffold(body: CartEmpty())
          : Scaffold(
              bottomSheet: checkoutSection(context, cartProvider.totalAmount),
              appBar: AppBar(
                //backgroundColor: Theme.of(context).backgroundColor,
                title: Text('Cart (${cartProvider.getCartItems.length})'),
                actions: [
                  IconButton(
                    onPressed: () {
                      globalMethods.showDialogg(
                          'Clear Cart',
                          'Do you want to delete your cart?',
                          () => cartProvider.clearCart(),
                          context);
                    },
                    icon: Icon(MyAppIcons.trash),
                  ),
                ],
              ),
              body: Container(
                margin: EdgeInsets.only(bottom: 60.0),
                child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                        child: CartFull(
                          // id: cartProvider.getCartItems.values.toList()[index].id,
                          productId:
                              cartProvider.getCartItems.keys.toList()[index],
                          // price: cartProvider.getCartItems.values
                          //     .toList()[index]
                          //     .price,
                          // title: cartProvider.getCartItems.values
                          //     .toList()[index]
                          //     .title,
                          // imageUrl: cartProvider.getCartItems.values
                          //     .toList()[index]
                          //     .imageUrl,
                          // quantity: cartProvider.getCartItems.values
                          //     .toList()[index]
                          //     .quantity,
                        ),
                      );
                    }),
              )),
    );
  }

  Widget checkoutSection(BuildContext ctx, double subtotal) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    MyColors.gradiendFStart,
                    MyColors.gradiendFEnd,
                  ], stops: [
                    0.0,
                    0.7,
                  ]),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                Theme.of(ctx).textSelectionTheme.selectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total: ',
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(ctx).textSelectionTheme.selectionColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'US \$${subtotal.toStringAsFixed(2)}',
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
