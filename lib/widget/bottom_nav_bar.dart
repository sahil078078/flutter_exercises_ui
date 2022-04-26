import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 10,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 8),
            blurRadius: 35,
            color: Colors.grey.withOpacity(0.8),
          ),
          const BoxShadow(
            offset: Offset(-5, -12),
            blurRadius: 35,
            color: Colors.white,
          )
        ],
      ),
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
