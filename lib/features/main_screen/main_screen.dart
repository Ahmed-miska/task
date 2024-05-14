import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/features/category_screen/category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home')),
    CategoryScreen(),
    Center(child: Text('My Account')),
    Center(child: Text('Cart')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(color: AppColor.whiteColor, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
          )
        ]),
        height: 55.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavBottomItem(
              selectedIndex: _selectedIndex,
              index: 0,
              onTap: () {
                _onItemTapped(0);
              },
              iconData: Icons.home_outlined,
              text: 'Home',
            ),
            NavBottomItem(
              selectedIndex: _selectedIndex,
              index: 1,
              onTap: () {
                _onItemTapped(1);
              },
              iconData: Icons.category_outlined,
              text: 'Categorise',
            ),
            NavBottomItem(
              selectedIndex: _selectedIndex,
              index: 2,
              onTap: () {
                _onItemTapped(2);
              },
              iconData: Icons.person_2_outlined,
              text: 'My Account',
            ),
            NavBottomItem(
              selectedIndex: _selectedIndex,
              index: 3,
              onTap: () {
                _onItemTapped(3);
              },
              iconData: Icons.shopping_cart_outlined,
              text: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class NavBottomItem extends StatelessWidget {
  const NavBottomItem({
    super.key,
    required int selectedIndex,
    required this.onTap,
    required this.index,
    required this.iconData,
    required this.text,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex, index;
  final void Function() onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData, color: _selectedIndex == index ? AppColor.primaryColor : AppColor.greyColor),
          Text(text, style: TextStyle(color: _selectedIndex == index ? AppColor.primaryColor : AppColor.greyColor)),
        ],
      ),
    );
  }
}
