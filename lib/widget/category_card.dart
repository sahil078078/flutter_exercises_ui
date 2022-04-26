import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
class CategoryCard extends StatelessWidget {
  final String svgSrc, title;
  final Function press;
  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
            color: kShadowColor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            press();
          },
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(svgSrc),
              const Spacer(),
              Text(
                title,
                style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}