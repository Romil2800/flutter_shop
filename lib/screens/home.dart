import 'package:backdrop/backdrop.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/consts/colors.dart';
import 'package:flutter_shop/inner_screens/brands_navigation_rail.dart';
import 'package:flutter_shop/provider/productProvider.dart';
import 'package:flutter_shop/screens/feeds.dart';
import 'package:flutter_shop/widgets/backlayer.dart';
import 'package:flutter_shop/widgets/category.dart';
import 'package:flutter_shop/widgets/popular_products.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/dell.jpg',
    'assets/images/apple.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final popularItems = productsData.popularProducts;

    return Scaffold(
        body: BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.25,
      appBar: BackdropAppBar(
        title: Text("Home"),
        leading: BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.starterColor,
                MyColors.endColor,
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 13,
                backgroundImage: NetworkImage(
                    'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
              ),
            ),
          ),
        ],
      ),
      backLayer: BackLayerMenu(),
      frontLayer: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190.0,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 5.0,
                dotIncreasedColor: Colors.purple,
                dotBgColor: Colors.black.withOpacity(0.2),
                dotPosition: DotPosition.bottomCenter,
                showIndicator: true,
                indicatorBgPadding: 5.0,
                images: [
                  ExactAssetImage(_carouselImages[0]),
                  ExactAssetImage(_carouselImages[1]),
                  ExactAssetImage(_carouselImages[2]),
                  ExactAssetImage(_carouselImages[3]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      index: index,
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Brands',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All..',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                itemCount: _brandImages.length,
                autoplay: true,
                viewportFraction: 0.8,
                onTap: (index) {
                  Navigator.of(context).pushNamed(
                      BrandNavigationRailScreen.routeName,
                      arguments: {index});
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueGrey,
                      child: Image.asset(
                        _brandImages[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(FeedsScreen.routeName,arguments: 'popular');
                    },
                    child: Text(
                      'View All..',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 285,
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                      value: popularItems[index],
                      child: PopularProducts(
                          // imageUrl: popularItems[index].imageUrl,
                          // title: popularItems[index].title,
                          // description: popularItems[index].description,
                          // price: popularItems[index].price,
                          ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
