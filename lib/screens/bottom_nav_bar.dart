import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakers/screens/favorite_screen/favorite_screen.dart';
import 'package:sneakers/screens/home_screen/home_screen.dart';
import 'package:sneakers/screens/notification_screen/notification_screen.dart';
import 'package:sneakers/screens/mycart_screen/mycart_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationScreen(),
    FavoriteScreen(),
    MyCartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.isNotEmpty ? _pages[_selectedIndex] : Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFEFFFFE),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home_filled, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.notifications_none, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite_border_rounded, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                _buildIcon(Icons.shopping_bag_outlined, 3),
                if (_selectedIndex != 3)
                  Positioned(
                    bottom: 30.h,
                    right: 10.w,
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Container(
      height: 50.w,
      width: 50.w,
      decoration:
          isSelected
              ? BoxDecoration(color: Colors.black87, shape: BoxShape.circle)
              : null,
      child: Icon(
        icon,
        // ignore: deprecated_member_use
        color: isSelected ? Colors.white : Colors.black.withOpacity(0.5),
        size: 26.sp,
      ),
    );
  }
}
