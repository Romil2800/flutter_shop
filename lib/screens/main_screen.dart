import 'package:flutter/material.dart';
import 'package:flutter_shop/inner_screens/upload_product_form.dart';
import 'package:flutter_shop/screens/bottom_bar.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        BottomBarScreen(),
        UploadProductForm(),
      ],
    );
  }
}
