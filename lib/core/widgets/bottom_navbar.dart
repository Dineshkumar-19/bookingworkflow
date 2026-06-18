import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,

      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      selectedItemColor: const Color(0xff5B2396),

      unselectedItemColor: Colors.grey,

      showUnselectedLabels: true,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Bookings",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: "Earnings",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}