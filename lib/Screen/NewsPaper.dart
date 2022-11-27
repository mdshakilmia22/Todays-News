import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prothom_alo/Screen/spalash.dart';
import 'package:prothom_alo/widget/home.dart';
import 'package:prothom_alo/widget/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/categorypage.dart';
import '../widget/search.dart';
class Newspaper extends StatefulWidget {
  const Newspaper({Key? key}) : super(key: key);

  @override
  State<Newspaper> createState() => _NewspaperState();
}

class _NewspaperState extends State<Newspaper> {

  int setIndex=1;
  int selectedIndex=0;

  void onTap(value){
    setState(() {
      selectedIndex=value;
    });
  }
  List<Widget> pageRoute=[
    const LatestNewsPage(),
    const CategoryPage(),
   const SearchPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
           currentIndex: selectedIndex,
            onTap: onTap,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey[600],

            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 25),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBold.category,size: 25),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,size: 25),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBold.profile,size: 25),
                label: 'Profile',
              ),
              
            ],
          ), 
          body: pageRoute.elementAt(selectedIndex),
    );
  }
}
