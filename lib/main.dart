import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './widgets/bottom_navigation.dart';
import './screens/settings_screen.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Raleway",
        // brightness: Brightness.dark,
      ),
      // home: HomeScreen(),
      home: Home(),

      // routes: <String, WidgetBuilder>{
      //   HomeScreen.routeName: (BuildContext context) => HomeScreen(),
      //   SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      // },
      // initialRoute: ,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screenList = [
    HomeScreen(),
    Text("Scheduled"),
    Text("Calender"),
    SettingsScreen(),
  ];
  PageController _pageController;
  int _selectedIndex = 0;

  void _changeIndex(int currentIndex) {
    // _pageController.jumpToPage(currentIndex);

    setState(() {
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(
          milliseconds: 500,
        ),
        curve: Curves.bounceInOut,
      );
      _selectedIndex = currentIndex;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // ScrollConfiguration(
      //   behavior: MyBehaveor(),
      //   child: 
        PageView(
          onPageChanged: (int currentPageIndex) {
            setState(() {
              _selectedIndex = currentPageIndex;
            });
          },
          children: screenList,
          controller: _pageController,
        ),
      // ),
      // body: screenList[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        changeIndex: _changeIndex,
      ),
    );
  }
}

class MyBehaveor extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}