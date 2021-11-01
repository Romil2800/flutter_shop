import 'package:flutter/material.dart';
import 'package:flutter_shop/inner_screens/product_details.dart';
import 'package:flutter_shop/inner_screens/upload_product_form.dart';
import 'package:flutter_shop/provider/dark_theme_provider.dart';
import 'package:flutter_shop/provider/favs_provider.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/screens/auth/login.dart';
import 'package:flutter_shop/screens/auth/sign_up.dart';
import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/inner_screens/categories_feeds.dart';
import 'package:flutter_shop/screens/feeds.dart';
import 'package:flutter_shop/screens/landing_page.dart';
import 'package:flutter_shop/screens/main_screen.dart';
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
          ChangeNotifierProvider(
            create: (_) {
              return FavsProvider();
            },
          ),
        ],
        child: Consumer<DarkThemeProvider>(
          builder: (context, themeData, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MainScreens(),
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
                LoginScreen.routeName: (ctx) => LoginScreen(),
                SignUpScreen.routeName: (ctx) => SignUpScreen(),
                BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                LandingPage.routeName: (ctx) => LandingPage(),
                UploadProductForm.routeName: (ctx) => UploadProductForm(),
              },
            );
          },
        ));
  }
}
