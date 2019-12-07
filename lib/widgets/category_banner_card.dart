import 'package:flutter/material.dart';

class CategoryBannerCard extends StatelessWidget {
  final String title;
  final List<Color> gradient;
  CategoryBannerCard({@required this.title, @required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            gradient[0],
            gradient[1],
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          // stops: [0.2, 1],
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.7),
        //     blurRadius: 5.0,
        //     spreadRadius: 3.0,
        //     offset: Offset(1, 1),
        //   ),
        // ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: Theme.of(context).primaryTextTheme.display1.fontSize * 0.7,
          color: Colors.white,
          fontFamily: "Tomorrow",
        ),
      ),
    );
  }
}
