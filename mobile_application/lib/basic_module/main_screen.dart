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
      endDrawer: _builddrawer(),
    );
  }

  Widget _buildbody(){
    return IndexedStack(
      index: _navIndex,
      children: [
        HomeScreen(),
        SearchScreen(),
        ScrollScreen(),
        ProfileScreen(),

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
        BottomNavigationBarItem(icon: Icon(Icons.face), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }

  Widget _builddrawer(){
    final logo ="https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/c3/64/46/c364465f-6271-8aae-93a8-b9979d2befe5/20UMGIM82075.rgb.jpg/1200x1200bf-60.jpg";
    final image ="https://wallpaperaccess.com/full/9558395.jpg";

    bool dark = context.watch<ThemeLogic>().dark;
    return Drawer(
      // backgroundColor: Colors.white.withAlpha(230),
      child: ListView(
        children: [
          DrawerHeader(child: Image.network(logo)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Contact"),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.moon_fill),
            title: Text("Night Mode"),
            trailing: Switch(
              value: dark, 
              onChanged: (value){
                context.read<ThemeLogic>().setDark(value);
              }),
            
          ),
          // ListTile(
          //   leading: Icon(Icons.light_mode),
          //   title: Text("Change To Light"),
          //   onTap: (){
          //     context.read<ThemeLogic>().changeToLight();
          //   },
          //   trailing: dark == false ? Icon(Icons.check_circle): null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.dark_mode),
          //   title: Text("Change To Dark"),
          //   onTap: (){
          //     context.read<ThemeLogic>().changeToDark();
          //   },
          //   trailing: dark == true ? Icon(Icons.check_circle): null,
          // ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  context.read<FontLogic>().decrease();
                }, 
                icon: Icon(Icons.text_decrease_rounded)),
              IconButton(
                onPressed: (){
                  context.read<FontLogic>().increase();
                }, 
                icon: Icon(Icons.text_increase_rounded)),
            ],
          ),
          Divider(),
          Padding(
            padding:const EdgeInsets.all(20),
            child: Image.network(image),
          ),
        ],
      ),
    );
  }
}