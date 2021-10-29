import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/inner_screens/product_details.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:provider/provider.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productsAttribute = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).backgroundColor,
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: productsAttribute.id),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: MediaQuery.of(context).size.height * 0.3,
                      ),
                      child: Image.network(
                        productsAttribute.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Badge(
                      alignment: Alignment.center,
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8.0)),
                      badgeContent:
                          Text('New', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(
                  left: 5,
                  bottom: 2,
                  right: 3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttribute.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$ ${productsAttribute.price.toString()}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productsAttribute.quantity.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18.0),
                            child: Icon(
                              Icons.more_horiz_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
