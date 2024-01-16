import 'package:flutter/material.dart';
import 'package:laura/screens/guardian/notification_screen.dart';
import 'package:laura/screens/student/home_screen.dart';
import 'package:laura/screens/student/payment_screen.dart';
import 'package:laura/screens/student/statistics_screen.dart';
import 'package:laura/utils/theme.dart';

import 'profile_screen.dart';

class DashboardNavigationBar extends StatefulWidget {
  const DashboardNavigationBar({super.key});

  @override
  _DashboardNavigationBarState createState() => _DashboardNavigationBarState();
}

class _DashboardNavigationBarState extends State<DashboardNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Add your pages here
    const HomeScreen(),
    const PaymentScreen(),
    Statistics(),
    const GuardianNotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black26,
        currentIndex: _currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 18,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_outlined),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
