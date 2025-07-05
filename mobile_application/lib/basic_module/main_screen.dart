import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/basic_module/home_screen.dart';
import 'package:mobile_application/basic_module/profile_screen.dart';
import 'package:mobile_application/basic_module/scroll_screen.dart';
import 'package:mobile_application/basic_module/search_screen.dart';
import 'package:mobile_application/basic_module/theme_screen.dart';
import 'package:provider/provider.dart';
import 'package:mobile_application/basic_module/font_theme.dart';


// import 'package:mobile_application/basic_module/tiktok_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () {
      //     _scaffoldKey.currentState!.openDrawer();
      //   }, icon: Icon(Icons.face)),
      // ),
      body: _buildbody(),
      bottomNavigationBar: _buildBottomNavBar(),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildbody(){
    return IndexedStack(
      index: _navIndex,
      children: [
        InstagramHomePage(),
        SearchScreen(),
        VideoScreen(),
        ProfilePage(),

      ],
    );
  }
  int _navIndex = 0;

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _navIndex,
      onTap: (index) {
        if (index == 4) {
          _scaffoldKey.currentState!.openEndDrawer();
        } else {
          setState(() {
            _navIndex = index;
          });
        }
      },
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Vedio"),
        BottomNavigationBarItem(icon: Icon(Icons.person_sharp), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }

  Widget _buildDrawer() {
    final logo =
        "https://play-lh.googleusercontent.com/n9_SKKjuOM-AK9Fmo0UB9dcBVm6bZOXq8_nUtuHSoZbQqxzdNvYIBDLcEE9JpbwN0n_V=w600-h300-pc0xffffff-pd";

    int themeIndex = context.watch<ThemeLogic>().themeIndex;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Avatar with Instagram gradient border
                  Container(
                    padding: EdgeInsets.all(4), // Border thickness
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFEDA77),
                          Color(0xFFF58529),
                          Color(0xFFDD2A7B),
                          Color(0xFF8134AF),
                          Color(0xFF515BD4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2), 
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://images.genius.com/28f3f303c54e8f1a3bfb81e9b992d8cf.1000x1000x1.png",
                        ),
                      ),
                    ),
                  ),

                  // Positioned Add icon (bottom right)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Contact"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ExpansionTile(
            title: Text("Theme Color"),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text("To System Mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToSystem();
                },
                trailing: themeIndex == 0 ? Icon(Icons.check_circle) : null,
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text("To Dark Mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToDark();
                },
                trailing: themeIndex == 1 ? Icon(Icons.check_circle) : null,
              ),
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text("To Light Mode"),
                onTap: () {
                  context.read<ThemeLogic>().changeToLight();
                },
                trailing: themeIndex == 2 ? Icon(Icons.check_circle) : null,
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<FontLogic>().decrease();
                },
                icon: Icon(Icons.text_decrease_rounded),
              ),
              IconButton(
                onPressed: () {
                  context.read<FontLogic>().increase();
                },
                icon: Icon(Icons.text_increase_rounded),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}