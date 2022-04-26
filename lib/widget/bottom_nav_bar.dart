import 'package:flutter/material.dart';

import '../constants.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonNavItem(
            press: () {},
            title: 'Today',
            svgSrc: 'assets/icons/calendar.svg',
          ),
          ButtonNavItem(
            press: () {},
            title: 'All Exercises',
            svgSrc: 'assets/icons/gym.svg',
            isActive: true,
          ),
          ButtonNavItem(
            press: () {},
            title: 'Settings',
            svgSrc: 'assets/icons/Settings.svg',
          ),
        ],
      ),
    );
  }
}

class ButtonNavItem extends StatelessWidget {
  final String svgSrc, title;
  final Function press;
  final bool isActive;

  const ButtonNavItem({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgSrc,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? kActiveIconColor : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}