import 'package:flutter/material.dart';
import 'package:flutter_shop/inner_screens/product_details.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/inner_screens/categories_feeds.dart';
import 'package:flutter_shop/screens/feeds.dart';
import 'package:flutter_shop/widgets/wishlist.dart';
import 'package:provider/provider.dart';

import 'inner_screens/brands_navigation_rail.dart';
import 'provider/cart_provider.dart';
import 'screens/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              return themeChangeProvider;
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return Products();
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              return CartProvider();
            },
          ),
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, themeData, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: BottomBarScreen(),
              routes: {
                //   '/': (ctx) => LandingPage(),
                BrandNavigationRailScreen.routeName: (ctx) =>
                    BrandNavigationRailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                FeedsScreen.routeName: (ctx) => FeedsScreen(),
                WishlistScreen.routeName: (ctx) => WishlistScreen(),
                ProductDetails.routeName: (ctx) => ProductDetails(),
                CategoriesFeedsScreen.routeName: (ctx) =>
                    CategoriesFeedsScreen(),
              },
            );
          },
        ));
  }
}
