import 'package:flutter/material.dart';

class GlobalMethods {
  Future<void> showDialogg(
      String title, String subTitle, Function fct, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.network(
                  'https://as2.ftcdn.net/v2/jpg/04/41/03/99/500_F_441039983_yjEK4dLmFNqTtE6I2hRATL62NOZFA8eV.jpg',
                  height: 20,
                  width: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            ],
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                fct();
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
