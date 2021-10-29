import 'package:flutter/material.dart';
import 'package:flutter_shop/inner_screens/categories_feeds.dart';
import 'package:flutter_shop/screens/feeds.dart';

class CategoryWidget extends StatefulWidget {
  final int index;
  CategoryWidget({Key key, this.index}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phone',
      'categoryImagePath': 'assets/images/CatPhones.png'
    },
    {
      'categoryName': 'Clothes',
      'categoryImagePath': 'assets/images/CatClothes.jpg'
    },
    {
      'categoryName': 'Shoes',
      'categoryImagePath': 'assets/images/CatShoes.jpg'
    },
    {
      'categoryName': 'Beauty & Health',
      'categoryImagePath': 'assets/images/CatBeauty.jpg'
    },
    {
      'categoryName': 'Laptops',
      'categoryImagePath': 'assets/images/CatLaptops.png'
    },
    {
      'categoryName': 'Furniture',
      'categoryImagePath': 'assets/images/CatFurniture.jpg'
    },
    {
      'categoryName': 'Watches',
      'categoryImagePath': 'assets/images/CatWatches.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName,
                arguments: '${categories[widget.index]['categoryName']}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    categories[widget.index]['categoryImagePath'],
                  ),
                  fit: BoxFit.cover),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName'],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Theme.of(context).textSelectionTheme.selectionColor),
            ),
          ),
          bottom: 0,
          left: 10,
          right: 10,
        ),
      ],
    );
  }
}
