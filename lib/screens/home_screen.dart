import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/weather_date.dart';

import '../widgets/category_banner_card.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/";
  final List<String> _categoryName = ["Meeting", "Personal", "Work", "Study"];

  final List<List<Color>> _categoryCardColor = [
    [
      Color.fromRGBO(197, 96, 255, 1.0),
      Color.fromRGBO(135, 9, 206, 1.0),
    ],
    [
      Color.fromRGBO(255, 248, 182, 1.0),
      Color.fromRGBO(255, 189, 145, 1.0),
    ],
    [
      Color.fromRGBO(218, 248, 227, 1.0),
      Color.fromRGBO(0, 194, 199, 1.0),
    ],
    [
      Color.fromRGBO(255, 189, 145, 1.0),
      Color.fromRGBO(255, 141, 113, 1.0),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hey Tuhin!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize:
                      Theme.of(context).primaryTextTheme.body1.fontSize * 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "What is your plan?",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize:
                      Theme.of(context).primaryTextTheme.body2.fontSize * 1.4,
                  fontWeight: FontWeight.w900,
                  wordSpacing: 3.5,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FloatingActionButton(
                elevation: 1,
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        ChangeNotifierProvider.value(
          value: WeatherDate(),
          child: WeatherCard(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 100.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {},
                        child: CategoryBannerCard(
                          title: _categoryName[index],
                          // gradient: _categoryCardColor[
                          //     Random().nextInt(_categoryCardColor.length)],
                          gradient: _categoryCardColor[index],
                        ),
                      );
                    },
                  ),
                );
              }
              if (index == 1) {
                return Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    "Upcoming To-do's",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize:
                          Theme.of(context).primaryTextTheme.body2.fontSize *
                              1.3,
                      fontWeight: FontWeight.w700,
                      wordSpacing: 3.5,
                    ),
                  ),
                );
              }
              return Card(
                margin: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 10.0,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  onTap: () {},
                  title: Text(
                    "8:30am-9:30am",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize:
                          Theme.of(context).primaryTextTheme.body1.fontSize *
                              1.25,
                    ),
                  ),
                  subtitle: Text(
                    "Now i'm going college. I have to ready for the college.",
                    style: TextStyle(
                      color: Colors.grey,
                      height: 2.0,
                      wordSpacing: 3.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
