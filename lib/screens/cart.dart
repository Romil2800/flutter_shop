import 'package:flutter/material.dart';
import 'package:flutter_shop/consts/colors.dart';
import 'package:flutter_shop/consts/my_icons.dart';
import 'package:flutter_shop/widgets/cart_empty.dart';
import 'package:flutter_shop/widgets/cart_full.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products = [];
    return Scaffold(
      body: !products.isEmpty
          ? Scaffold(body: CartEmpty())
          : Scaffold(
              bottomSheet: checkoutSection(context),
              appBar: AppBar(
                title: Text('Cart Items Count'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(MyAppIcons.trash)),
                ],
              ),
              body: Container(
                margin: EdgeInsets.only(bottom: 60.0),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CartFull();
                    }),
              )),
    );
  }

  Widget checkoutSection(BuildContext ctx) {
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
                    MyColors.gradientFStart,
                    MyColors.gradientFEnd,
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
              'US \$102000',
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
