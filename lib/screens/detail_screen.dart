import 'package:flutter/material.dart';
import 'package:flutter_exercises_ui/constants.dart';
import 'package:flutter_exercises_ui/widget/search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bottom_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: kBlueLightColor.withOpacity(0.4),
              image: const DecorationImage(
                image: AssetImage('assets/images/meditation_bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                // physics: const AlwaysScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                      // it will take %5 of total height
                    ),
                    Text(
                      'Meditation',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '3-10 Min Course',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: size.width * 0.60,
                      // it will take 60% of total width
                      child: const Text(
                          'Live happier and healthier by learning the fundamentals of meditation and mindfulness'),
                    ),
                    SizedBox(
                      width: size.width * 0.60,
                      // it will take 60% of width of screen width
                      child: const SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(sessionNo: 1, isDone: true, press: () {}),
                        SessionCard(sessionNo: 2, press: () {}),
                        SessionCard(sessionNo: 3, press: () {}),
                        SessionCard(sessionNo: 4, press: () {}),
                        SessionCard(sessionNo: 5, press: () {}),
                        SessionCard(sessionNo: 6, press: () {}),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Meditation',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/icons/Meditation_women_small.svg'),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Basic 02',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                const Text('Start your deepen you practice')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/icons/Lock.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNo;
  final bool isDone;
  final Function press;

  const SessionCard({
    Key? key,
    required this.sessionNo,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        width: constraints.maxWidth / 2 - 10,
        // maxWidth provide available max width of widget
        // padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: kShadowColor,
            ),
          ],
        ),
        child: ClipRRect(
          // clipRRect use for give shape for inkwell
          // effect with same shape as shape of container
          borderRadius: BorderRadius.circular(12),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                press();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueLightColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueLightColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueLightColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Session ' + sessionNo.toString().padLeft(2, '0'),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
